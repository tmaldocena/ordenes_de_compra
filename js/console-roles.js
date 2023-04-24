var table;
var idRoleUpdate;

$(document).ready(function () {
    $('#tabla_roles').DataTable();
    listar_area();
    addIDs();
    $('#roleState').select2({
        minimumResultsForSearch: Infinity
    })
});


function listar_area(){

    table = $("#tabla_roles").DataTable({
		"ordering":false,
        "lengthChange": false,
        "bFilter": false,
        "destroy":true,
        "async": false ,
        "responsive": true,
    	"autoWidth": false,
        "ajax":{
            "method":"POST",
		    "url":"../controllers/role/roleController.php",
        },
        "columns":[
            {"defaultContent": "-"},
            {"data":"nombre"},
            {"data":"state", 
                render: function(data,type,row){
                    if(data==="ACTIVO"){
                        return "<span class='badge badge-success badge-pill m-r-5 m-b-5'>"+data+"</span>"
                    }else{
                        return "<span class='badge badge-danger badge-pill m-b-5'>"+data+"</span>"
                    }
            }},
            {"defaultContent":"<button class='btn btn-success btn-rounded btn-sm edit'><i class='fa fa-edit'></i></button>"}
        ],
        "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
        	$($(nRow).find("td")[5]).css('text-align', 'center' );
        },
        "language":idioma_espanol,
        select: true
	});
    $("#tabla_roles_filter").css('float', 'left');

}

function addIDs(){
    let roles = [];
    let cont = 0;
    $.ajax({
        "method":"POST",
        "url":"../controllers/role/roleController.php"
    }).done(function(resp){
        roles = JSON.parse(resp).data;
        $("#tabla_roles > tbody > tr").each(function(){
            $(this).attr("id", roles[cont].role_id);
            cont++;
        });
    })
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

$('#modal_createRole').on('shown.bs.modal', function () {
    $('#input_role').trigger('focus')
})

$(document).on('click', "#AddRole", function(){
    $('#modal_createRole').modal('show');
})

$(document).on('click', '#createRole', function(){
    var rol = $("#input_role").val();
    if(rol.length == 0){
        Swal.fire("Atención!", "Campo vacío", "warning");
        $('#modal_createRole').modal('hide');
    }else{
        $.ajax({
            url: '../controllers/role/createRoleController.php',
            type: 'POST',
            data:{
                role: rol
            }
        }).done(function(resp){
            if(resp > 0){
                if(resp == 1){
                    table.ajax.reload();
                    Swal.fire("Registrado Correctamente", "Rol creado exitosamente", "success");
                    $('#modal_createRole').modal('hide');
                }else{
                    Swal.fire("Error al registrar", "Ya existe ese nombre en un rol", "warning");
                }
            }else{
                Swal.fire("Error al registrar", "No se pudo completar la operación", "error");
            }
        })
    }
})
$(document).on('click', '#updateRole', function(){
    var rolename = $('#edit_role').val();
    var rolestate = $('#roleState').val();
    var idRole = idRoleUpdate;
    console.log(idRole, rolename, rolestate);
     if(rolename.length == 0){
        Swal.fire("Atención!", "Campo vacío", "warning");
        $('#modal_editRole').modal('hide');
    }else{
        $.ajax({
            url: '../controllers/role/editRoleController.php',
            type: 'POST',
            data:{
                id: idRole,
                role: rolename,
                state: rolestate
            }
        }).done(function(resp){
            if(resp > 0){
                if(resp == 1){
                    table.ajax.reload();
                    Swal.fire("Registrado Correctamente", "Rol actualizado exitosamente", "success");
                    $('#modal_editRole').modal('hide');
                }else{
                    Swal.fire("Error al registrar", "Ya existe ese nombre en un rol", "warning");
                }
            }else{
                Swal.fire("Error al registrar", "No se pudo completar la operación", "error");
            }
        })
    }
})

$("#tabla_roles").on("click", ".edit", function(){
    var data = table.row($(this).parents('tr')).data();
    idRoleUpdate = data.role_id;
    if(table.row(this).child.isShown()){
        var data = table.row(this).data();
    }
    $('#edit_role').val(data.nombre);
    if(data.state === "ACTIVO"){
        $('#roleState:nth-child(1)').attr('selected', true);
    }else{
        $('#roleState:nth-child(2)').attr('selected', true);
    }
    $('#modal_editRole').modal('show');
})