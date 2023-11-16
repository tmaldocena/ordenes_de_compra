const urlParams = new URLSearchParams(window.location.search);
const idProveedor = urlParams.get('proveedor') || 0;
const idTransporte = urlParams.get('transporte') || 0;
let idContacto;

console.log(idProveedor, idTransporte);

$(document).ready(function(){
    $.ajax({
        "method": 'POST',
        "url":"../controllers/contactos/contactosController.php",
        "data":{
            proveedor_id: idProveedor,
            transporte_id: idTransporte
        }
    }).done(function(resp){
        if(resp === 'null'){
            $('#tableContacto').hide();
            $('#center').prepend(`
            <h4 class="font-strong mt-3">No hay ningun contacto todavia.</h4>
            `)
            $('#contacto_D').hide();
        }else{
            cont = 1;
            data = JSON.parse(resp).data;
            let seleccionado;
            let btn;
            console.log(data);
            data.forEach(contacto => {
                btn = `<button class="btn btn-success editBtn" data-toggle="tooltip" data-placement="top" title="" data-original-title="Editar contacto"><i class='fa fa-edit'></i></button>`; 
                $("#tbodyContacto").append(`
                <tr id='${contacto.contacto_id}' title='${contacto.nombre}'>
                    <td>${cont++}</td>
                    <td>${contacto.nombre}</td>
                    <td>${contacto.telefono}</td>
                    <td>${contacto.correo}</td>
                    <td>${btn}</td>
                </tr>`);
            }); 
        }
    })
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
})

$('#volver').click(function() {
    history.back();
})

$('#addContacto').click(function(){
    $('#modal_createContacto').modal('show');
})

$('#addC').click(function(){
    var nombre = $("#nameContacto").val();
    var telefono = $("#telefonoContacto").val();
    var correo = $("#mailContacto").val();
    if(nombre.length == 0 || telefono.length == 0 || correo.length == 0){
        Swal.fire("Atención!", "Campo vacío", "warning");
    }else{
         $.ajax({
            url: '../controllers/contactos/createContactosController.php',
            type: 'POST',
            data:{
                nombre: nombre,
                telefono: telefono,
                correo: correo,
                transporte_id: idTransporte,
                proveedor_id: idProveedor
            }
        }).done(function(resp){
            if(resp > 0){
                if(resp == 1){
                    Swal.fire("Registrado Correctamente", "Contacto agregado exitosamente", "success").then(function(){
                        $('#modal_createPresu').modal('hide');
                        window.location.reload();
                    });
                }else{
                    Swal.fire("Error al agregar", "No se pudo agregar el contacto", "warning");
                }
            }else{
                Swal.fire("Error al agregar", "No se pudo completar la operación", "error");
            }
        })
    }
})

$("#tableContacto").on("click", ".editBtn", function(){
    idContacto = $(this).closest('tr').attr('id');
    contacto = document.getElementById(idContacto).children;
    let name = contacto.item(1).innerHTML;
    let telefono = contacto.item(2).innerHTML;
    let correo = contacto.item(3).innerHTML;

    console.log(idContacto, name, telefono, correo)

    $('#nameContactoEdit').val(name);
    $('#telefonoContactoEdit').val(telefono);
    $('#mailContactoEdit').val(correo);
    $('#modal_editContacto').modal('show');
})

$(document).on('click', '#updateContacto', function(){
    var name = $("#nameContactoEdit").val();
    var telefono = $("#telefonoContactoEdit").val();
    var mail = $("#mailContactoEdit").val();
    if(name.length == 0 || telefono.length == 0 || mail.length == 0){
        Swal.fire("Atención!", "Campo vacío", "warning");
    }else{
        console.log(idContacto, name, telefono, mail);
         $.ajax({
            url: '../controllers/contactos/updateContactosController.php',
            type: 'POST',
            data:{
                id: idContacto,
                nombre: name,
                telefono: telefono,
                correo: mail
            }
        }).done(function(resp){
            if(resp > 0){
                if(resp == 1){
                    Swal.fire("Actualizado Correctamente", "Contacto actualizado exitosamente", "success");
                    $('#modal_editProveedor').modal('hide');
                    window.location.reload();
                }else{
                    Swal.fire("Error al registrar", "Ya existe ese nombre en un rol", "warning");
                }
            }else{
                Swal.fire("Error al actualizar", "No se pudo completar la operación", "error");
            }
        })
    }
})