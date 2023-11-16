var table;
var idProveedorUpdate;
$(document).ready(function () {
    $('#tabla_proveedores').DataTable();
    listar_proveedores();
    $('.dataTables_filter input[type="search"]').attr('placeholder','Buscar proveedor...').css({'width':'350px','display':'inline-block'});
});

function listar_proveedores(){
    table = $("#tabla_proveedores").DataTable({
		"ordering":true,
        "lengthChange": false,
        "bFilter": true,
        "destroy":true,
        "async": false ,
        "responsive": true,
    	"autoWidth": false,
        "ajax":{
            "method":"POST",
		    "url":"../controllers/proveedores/proveedoresController.php",
        },
        "columns":[
            {"data": "proveedor_id"},
            {"data":"nombre"},
            {"data":"rubro"},
            {"data": null, render: 
                function(data,type,row){
                    let rate;
                    console.log(data)
                    if(data.cant_rating === '0' && data.acum_rating === '0'){
                        rate = '0.00';
                    }else{
                        rate = (data.acum_rating / data.cant_rating).toFixed(2);
                    }
                    return '<span>'+ rate + '</span>';
                }
            },
            {"defaultContent":`<div class="btn-group m-b-10">
            <button class="btn btn-success contactoBtn" data-toggle="tooltip" data-placement="top" title="" data-original-title="Ver Contactos"><i class='fa fa-user'></i></button>
            <button class="btn btn-info editBtn"><i class='fa fa-edit' data-toggle="tooltip" data-placement="top" title="" data-original-title="Editar Proveedor"></i></button>
            </div>`}
        ],
        "language":idioma_espanol,
        select: true
	});
    $("#tabla_ordenes_filter").css('float', 'left');
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
}

var idioma_espanol = {
    select: {
        rows: "%d fila seleccionada"
    },
    "sProcessing": "Procesando...",
    "sLengthMenu": "Mostrar MENU registros",
    "sZeroRecords": "No se encontraron resultados",
    "sEmptyTable": "Ning&uacute;n dato disponible en esta tabla",
    "sInfo": "Registros del (_START_ al _END_) total de _TOTAL_ registros",
    "sInfoEmpty": "Registros del (0 al 0) total de 0 registros",
    "sInfoFiltered": "(filtrado de un total de MAX registros)",
    "sInfoPostFix": "",
    "sSearch": "Buscar:",
    "sUrl": "",
    "sInfoThousands": ",",
    "sLoadingRecords": "<b>No se encontraron datos</b>",
    "oPaginate": {
        "sFirst":    "Primero",
        "sLast":     "Último",
        "sNext":     "Siguiente",
        "sPrevious": "Anterior"
    },
    "oAria":{
        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    }
}

$('#tabla_proveedores').on('click', '.contactoBtn', function(){
    var data = table.row($(this).parents('tr')).data();
    idContacto = data.proveedor_id;
    window.location.href = `../../views/contacto.php?proveedor=${idContacto}`;
})

$('#modal_createProveedor').on('shown.bs.modal', function () {
    $('#ordenName').trigger('focus')
})

$('#AddProveedor').click(function() {
$('#modal_createProveedor').modal('show');
})

$(document).on('click', '#createOrden', function(){
    var name = $("#proveedorName").val();
    var rubro = $("#proveedorRubro").val();
    console.log(name, rubro);
    if(name.length == 0 || rubro.length == 0){
        Swal.fire("Atención!", "Campo vacío", "warning");
    }else{
         $.ajax({
            url: '../controllers/proveedores/createProveedoresController.php',
            type: 'POST',
            data:{
                nombre: name,
                rubro: rubro,
            }
        }).done(function(resp){
            if(resp > 0){
                if(resp == 1){
                    table.ajax.reload();
                    Swal.fire("Agregado Correctamente", "Nuevo proveedor cargado exitosamente", "success");
                    $('#modal_createProveedor').modal('hide');
                }else{
                    Swal.fire("Error al crear", "Ya existe ese nombre en un rol", "warning");
                }
            }else{
                Swal.fire("Error al registrar", "No se pudo completar la operación", "error");
            }
        })
    }
})

$("#tabla_proveedores").on("click", ".editBtn", function(){
    var data = table.row($(this).parents('tr')).data();
    idProveedorUpdate = data.proveedor_id;
    if(table.row(this).child.isShown()){
        var data = table.row(this).data();
    }
    $('#proveedorNameEdit').val(data.nombre);
    $('#proveedorRubroEdit').val(data.rubro);
    $('#modal_editProveedor').modal('show');
})

$(document).on('click', '#updateProveedor', function(){
    var name = $("#proveedorNameEdit").val();
    var rubro = $("#proveedorRubroEdit").val();
    if(name.length == 0 || rubro.length == 0){
        Swal.fire("Atención!", "Campo vacío", "warning");
    }else{
         $.ajax({
            url: '../controllers/proveedores/updateProveedoresController.php',
            type: 'POST',
            data:{
                id: idProveedorUpdate,
                nombre: name,
                rubro: rubro,
            }
        }).done(function(resp){
            if(resp > 0){
                if(resp == 1){
                    table.ajax.reload();
                    Swal.fire("Actualizado Correctamente", "Proveedor actualizado exitosamente", "success");
                    $('#modal_editProveedor').modal('hide');
                }else{
                    Swal.fire("Error al registrar", "Ya existe ese nombre en un rol", "warning");
                }
            }else{
                Swal.fire("Error al actualizar", "No se pudo completar la operación", "error");
            }
        })
    }
})