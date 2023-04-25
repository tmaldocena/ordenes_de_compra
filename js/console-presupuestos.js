const urlParams = new URLSearchParams(window.location.search);
const idOrden = urlParams.get('idOrden');

$(document).ready(function(){
    let nro = 4 - parseInt(idOrden.length);
    let orden = '0'.repeat(nro);
    $("#titulo").html(`Presupuestos de la orden #${orden}${idOrden}`);
    $.ajax({
        "method": 'POST',
        "url":"../controllers/presupuestos/presupuestosController.php",
        "data":{
            orden_id: idOrden
        }
    }).done(function(resp){
        if(resp === 'null'){
            $('#tablePresupuesto').hide();
            $('#center').prepend(`
            <h4 class="font-strong mt-3">No hay ningun presupuesto todavia.</h4>
            `)
            $('#presu_D').hide();
        }else{
            cont = 1;
            data = JSON.parse(resp).data;
            let seleccionado;
            let btn;
            data.forEach(presu => {
                seleccionado = (presu.seleccionado == 'S' ?  `<i class="fa fa-check text-success" aria-hidden="true"></i>` : `<i class="fa fa-times text-danger" aria-hidden="true"></i>`);
                btn = (presu.seleccionado == 'N' ? `<button class="btn btn-success selectBtn" data-toggle="tooltip" data-placement="top" title="" data-original-title="Seleccionar Presupuesto"><i class='fa fa-usd'></i></button>` : `<button class="btn btn-danger unselectBtn" data-toggle="tooltip" data-placement="top" title="" data-original-title="Deseleccionar Presupuesto"><i class='fa fa-usd'></i></button>`);
                $("#tbodyPresupuesto").append(`
                <tr id='${presu.pres_id}' title='Seleccionar presupuesto'>
                    <td>${cont++}</td>
                    <td>${presu.tienda}</td>
                    <td>$${presu.precio}</td>
                    <td>${seleccionado}</td>
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

$('#addPresupuesto').click(function(){
    $('#modal_createPresu').modal('show');
})

$('#addP').click(function(){
    var lugar = $("#lugarP").val();
    var precio = $("#precioP").val();
    console.log(precio, lugar);
    if(lugar.length == 0 || precio == 0){
        Swal.fire("Atención!", "Campo vacío", "warning");
        $('#modal_createPresu').modal('hide');
    }else{
         $.ajax({
            url: '../controllers/presupuestos/createPresupuestoController.php',
            type: 'POST',
            data:{
                orden_id: idOrden,
                tienda: lugar,
                precio: precio
            }
        }).done(function(resp){
            if(resp > 0){
                if(resp == 1){
                    Swal.fire("Registrado Correctamente", "Presupuesto agregado exitosamente", "success").then(function(){
                        $('#modal_createPresu').modal('hide');
                        window.location.reload();
                    });
                }else{
                    Swal.fire("Error al agregar", "No se pudo agregar el presupuesto", "warning");
                }
            }else{
                Swal.fire("Error al agregar", "No se pudo completar la operación", "error");
            }
        })
    }
})

$(document).on('click', ".selectBtn", function(){
    console.log($(this).closest('tr'));
    let id = $(this).closest('tr').attr('id');
    let presu = document.getElementById(id).children;
    let name = presu.item(1).innerHTML;
    let precio = presu.item(2).innerHTML;
    Swal.fire({
        title: 'Estás seguro?',
        text: "Se va a seleccionar el siguiente presupuesto",
        html: `
        <div>
            <p class='font-strong'><em>Se va a seleccionar el siguiente presupuesto:</em></p>
            <p class='font-strong'>${name} con precio:  ${precio}</p>
        </div>`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, seleccionar'
      }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: '../controllers/presupuestos/selectPresupuestoController.php',
                type: 'POST',
                data:{
                    id: id,
                    idOrden: idOrden,
                    select: 'si'
                }
            }).done(function(resp){
                if(resp > 0){
                    if(resp == 1){
                        Swal.fire('Seleccionado correctamente!', 'Se seleccionó el presupuesto correctamente.', 'success').then(function(){
                            window.location.reload();
                        });
                    }else{
                        Swal.fire("Error al seleccionar", "Ya existe un presupuesto seleccionado.", "error");

                    }
            }
        });
        }else{
            Swal.fire('Operación cancelada!', 'No se seleccionó el presupuesto.', 'warning')
        }
        })
})
$(document).on('click', ".unselectBtn", function(){
    console.log($(this).closest('tr'));
    let id = $(this).closest('tr').attr('id');
    let presu = document.getElementById(id).children;
    let name = presu.item(1).innerHTML;
    let precio = presu.item(2).innerHTML;
    Swal.fire({
        title: 'Estás seguro?',
        text: "Se va a seleccionar el siguiente presupuesto",
        html: `
        <div>
            <p class='font-strong'><em>Se va a deseleccionar el siguiente presupuesto:</em></p>
            <p class='font-strong'>${name} con precio:  ${precio}</p>
        </div>`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, deseleccionar'
      }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: '../controllers/presupuestos/selectPresupuestoController.php',
                type: 'POST',
                data:{
                    id: id,
                    idOrden: idOrden,
                    select: 'no'
                }
            }).done(function(resp){
                if(resp > 0){
                    if(resp == 1){
                        Swal.fire('Deseleccionado correctamente!', 'Se quitó el presupuesto correctamente.', 'success').then(function(){
                            window.location.reload();
                        });
                    }else{
                        Swal.fire("Error al deseleccionar", "error");

                    }
            }
        });
        }else{
            Swal.fire('Operación cancelada!', 'No se deseleccionó el presupuesto.', 'warning')
        }
        })
})

//* AGREGAR SI ESTÁ SELECCIONADO Y MOSTRARLO EN LA TABLA
