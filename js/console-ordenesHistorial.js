var table;
var sectorN = '';
var idOrdenUpdate;
$(document).ready(function () {
    $('#tabla_ordenes').DataTable();
    listar_ordenes();
    //* mostrar si está presupuestada, con cuanto $$$
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
                    if(data === 0 || data === null){
                        return `<i class="fa fa-times text-danger" aria-hidden="true"></i>`;
                    }else{
                        return `<i class="fa fa-check text-success" aria-hidden="true"></i>`;
                    }
                }
            }
        ],
        "language":idioma_espanol,
        select: true
	});
    $('.dataTables_filter input[type="search"]').attr('placeholder','Buscar orden...').css(
        {'width':'350px','display':'inline-block'}
     );
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
    default:
        break;
}
}


