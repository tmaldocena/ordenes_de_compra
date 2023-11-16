var table;
var sectorN = '';
var idOrdenUpdate;
$(document).ready(function () {
    $('#tabla_ordenes').DataTable();
    listar_ordenes();
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
		    "url":"../controllers/ordenesT/ordenesTController.php",
        },
        "columns":[
            {"data": "ordenesT_id",
                render: function(data,type,row){
                    idOrdenPresupuesto = data;
                    let zeroes = 4 - data.length;
                    return `<p>`+'0'.repeat(zeroes)+`${data}</p>`;
            }},
            {"data":"desde"},
            {"data":"hasta"},
            {"data":"fecha_transporte"},
            {"data":"solicitante"},
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
    $('#ordenDesde').trigger('focus')
})

$('#AddOrdenT').click(function() {
    $('#modal_createOrden').modal('show');
})

$(document).on('click', '#createOrden', function(){
    var desde = $("#ordenDesde").val();
    var hasta = $("#ordenHasta").val();
    var solicitante = $("#ordenSolicita").val();
    console.log(desde, hasta, solicitante);
    if(desde.length == 0 || hasta.length == 0 || solicitante.length === 0){
        Swal.fire("Atención!", "Campo vacío", "warning");
    }else{
        $.ajax({
            url: '../controllers/ordenesT/createOrdenTController.php',
            type: 'POST',
            data:{
                desde: desde,
                hasta: hasta,
                solicitante: solicitante
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
    var desde = $("#ordenDesdeEdit").val();
    var hasta = $("#ordenHastaEdit").val();
    var solicitante = $("#ordenSolicitaEdit").val();
    console.log(idOrdenUpdate ,desde, hasta, solicitante);
    if(desde.length == 0 || hasta.length == 0 || solicitante.length === 0){
        Swal.fire("Atención!", "Campo vacío", "warning");
    }else{
        
         $.ajax({
            url: '../controllers/ordenesT/updateOrdenTController.php',
            type: 'POST',
            data:{
                id: idOrdenUpdate,
                desde: desde,
                hasta: hasta,
                solicitante: solicitante
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
    idOrdenUpdate = data.ordenesT_id;
    if(table.row(this).child.isShown()){
        var data = table.row(this).data();
    }
    $('#ordenDesdeEdit').val(data.desde);
    $('#ordenHastaEdit').val(data.hasta);
    $('#ordenSolicitaEdit').val(data.solicitante);
    $('#modal_editOrden').modal('show');
})

$('#tabla_ordenes').on('click', '.deleteBtn', function(){
    var data = table.row($(this).parents('tr')).data();
    idOrdenUpdate = data.ordenesT_id;
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
                url: '../controllers/ordenesT/deleteOrdenesTController.php',
                type: 'POST',
                data:{
                    id: idOrdenUpdate,
                }
            }).done(function(resp){
                if(resp > 0){
                    if(resp == 1){
                        table.ajax.reload();
                        Swal.fire('Eliminada exitosamente!', 'Se eliminó la orden de transporte seleccionada.', 'success');
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
    idOrdenTransporte = data.ordenesT_id;
    window.location.href = `../../views/presupuestosTransporte.php?idOrden=${idOrdenTransporte}`;
})


