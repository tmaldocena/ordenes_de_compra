var table;
var sectorN = '';
var idOrdenUpdate;
$(document).ready(function () {
    $('#tabla_ordenes').DataTable();
    listar_ordenes();
    let sectores;
    $.ajax({
        "method":"POST",
        "url":"../controllers/sectores/sectoresController.php"
    }).done(function(resp){
        sectores = JSON.parse(resp).data;
        sectores.forEach(sector => {
            $('#selectSector').append(`<option value='${sector.sector_id}'>${sector.nombre}</option>`);
            $('#selectSectorEdit').append(`<option value='${sector.sector_id}'>${sector.nombre}</option>`);
        });
    });
    $('#selectSector').select2({
        minimumResultsForSearch: Infinity
    });
    $('.dataTables_filter input[type="search"]').attr('placeholder','Buscar orden...').css({'width':'350px','display':'inline-block'});
});

function listar_ordenes(){
    table = $("#tabla_ordenes").DataTable({
		"ordering":true,
        "lengthChange": false,
        "bFilter": true,
        "destroy":true,
        "async": false ,
        "responsive": true,
    	"autoWidth": false,
        "ajax":{
            "method":"POST",
		    "url":"../controllers/ordenes/ordenesController.php",
        },
        "columns":[
            {"data": "orden_id",
                render: function(data,type,row){
                    idOrdenPresupuesto = data;
                    let zeroes = 4 - data.length;
                    return `<p>`+'0'.repeat(zeroes)+`${data}</p>`;
            }},
            {"data":"nombre"},
            {"data":"cantidad"},
            {"data":"sectorID", render: 
                function(data,type,row){
                    return '<span>'+sectorNamed(data)+'</span>';
                }
            },
            {"data":"fecha_apertura"},
            {"data":"autorizada", 
                render: function(data,type,row){
                    if(data==="SI"){
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>Si</span>"
                    }else{
                        return "<span class='badge badge-danger badge-pill m-b-5'>No</span>"
                    }
            }},
            {"data":"presupuesto_id",
                render: function(data,type,row){
                    if(data === '0' || data === null){
                        return `<i class="fa fa-times text-danger" aria-hidden="true"></i>`;
                    }else{
                        return `<i class="fa fa-check text-success" aria-hidden="true"></i>`;
                    }
                }
            },
            {"defaultContent":`<div class="btn-group m-b-10">
            <button class="btn btn-success presupuestoBtn" data-toggle="tooltip" data-placement="top" title="" data-original-title="Ver Presupuestos"><i class='fa fa-usd'></i></button>
            <button class="btn btn-info editBtn"><i class='fa fa-edit' data-toggle="tooltip" data-placement="top" title="" data-original-title="Editar Orden"></i></button>
            <button class="btn btn-danger deleteBtn"><i class='fa fa-trash' data-toggle="tooltip" data-placement="top" title="" data-original-title="Eliminar Orden"></i></button>
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

$('#modal_createOrden').on('shown.bs.modal', function () {
        $('#ordenName').trigger('focus')
})

$('#AddOrden').click(function() {
    $('#modal_createOrden').modal('show');
})

$(document).on('click', '#createOrden', function(){
    var name = $("#ordenName").val();
    var cant = $("#ordenCant").val();
    var sector = $("#selectSector option:selected").val();
    var checkAuth = $("#authorizedCheck").is(":checked");
    console.log(name, cant, sector, checkAuth);
    if(name.length == 0 || cant == 0 || sector === '0'){
        Swal.fire("Atención!", "Campo vacío", "warning");
        $('#modal_createOrden').modal('hide');
    }else{
         $.ajax({
            url: '../controllers/ordenes/createOrdenController.php',
            type: 'POST',
            data:{
                nombre: name,
                cantidad: cant,
                sector: sector,
                autorizada: (checkAuth ? 'SI' : 'NO')
            }
        }).done(function(resp){
            if(resp > 0){
                if(resp == 1){
                    table.ajax.reload();
                    Swal.fire("Registrado Correctamente", "Orden creada exitosamente", "success");
                    $('#modal_createOrden').modal('hide');
                }else{
                    Swal.fire("Error al registrar", "Ya existe ese nombre en un rol", "warning");
                }
            }else{
                Swal.fire("Error al registrar", "No se pudo completar la operación", "error");
            }
        })
    }
})

$(document).on('click', '#updateOrden', function(){
    var name = $("#ordenNameEdit").val();
    var cant = $("#ordenCantEdit").val();
    var sector = $("#selectSectorEdit option:selected").val();
    var checkAuth = $("#authorizedCheckEdit").is(":checked");
    console.log(name, cant, sector, checkAuth);
    if(name.length == 0 || cant == 0 || sector === '0'){
        Swal.fire("Atención!", "Campo vacío", "warning");
        $('#modal_editOrden').modal('hide');
    }else{
         $.ajax({
            url: '../controllers/ordenes/updateOrdenController.php',
            type: 'POST',
            data:{
                id: idOrdenUpdate,
                nombre: name,
                cantidad: cant,
                sector: sector,
                autorizada: (checkAuth ? 'SI' : 'NO')
            }
        }).done(function(resp){
            if(resp > 0){
                if(resp == 1){
                    table.ajax.reload();
                    Swal.fire("Actualizado Correctamente", "Orden actualizada exitosamente", "success");
                    $('#modal_editOrden').modal('hide');
                }else{
                    Swal.fire("Error al registrar", "Ya existe ese nombre en un rol", "warning");
                }
            }else{
                Swal.fire("Error al registrar", "No se pudo completar la operación", "error");
            }
        })
    }
})

$("#tabla_ordenes").on("click", ".editBtn", function(){
    var data = table.row($(this).parents('tr')).data();
    idOrdenUpdate = data.orden_id;
    if(table.row(this).child.isShown()){
        var data = table.row(this).data();
    }
    $('#ordenNameEdit').val(data.nombre);
    $('#ordenCantEdit').val(data.cantidad);
    $('#selectSectorEdit').val(data.sectorID);
    if(data.autorizada === "SI"){
        $('#authorizedCheckEdit').prop('checked', true);;
    }else{
        $('#authorizedCheckEdit').prop('checked', false);;
    }
    $('#modal_editOrden').modal('show');
})

$('#tabla_ordenes').on('click', '.deleteBtn', function(){
    var data = table.row($(this).parents('tr')).data();
    idOrdenUpdate = data.orden_id;
    Swal.fire({
        title: 'Estás seguro?',
        text: "Se eliminará la orden seleccionada!",
        icon: 'warning',
        showCancelButton: true,
        cancelButtonText: 'Cancelar',
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, eliminar orden!'
      }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: '../controllers/ordenes/deleteOrdenController.php',
                type: 'POST',
                data:{
                    id: idOrdenUpdate,
                }
            }).done(function(resp){
                if(resp > 0){
                    if(resp == 1){
                        table.ajax.reload();
                        Swal.fire('Eliminada exitosamente!', 'Se eliminó la orden de compra seleccionada.', 'success');
                    }
                }else{
                    Swal.fire("Error al registrar", "No se pudo completar la operación", "error");
                }
            });
        }else{
            Swal.fire('Operación cancelada!', 'No se eliminó la orden seleccionada.', 'warning')
        }
        })
})

$('#tabla_ordenes').on('click', '.presupuestoBtn', function(){
    var data = table.row($(this).parents('tr')).data();
    idOrdenPresupuesto = data.orden_id;
    window.location.href = `../../views/presupuestos.php?idOrden=${idOrdenPresupuesto}`;
})

function sectorNamed(id){
switch (id) {
    case '1':
        return 'Administración'
        break;
    case '2':
        return 'Pañol'
        break;
    case '3':
        return 'Mantenimiento'
        break;
    case '4':
        return 'Molino de Reciclado'
        break;
    case '5':
        return 'Producción'
        break;
    case '6':
        return 'Laboratorio/Control de calidad'
        break;
    case '7':
        return 'Logística'
        break;
    case '8':
        return 'Arquitecto'
        break;
    case '9':
        return 'Talento Humano'
        break;
    default:
        break;
}
}


