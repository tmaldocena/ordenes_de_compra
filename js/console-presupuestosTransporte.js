const urlParams = new URLSearchParams(window.location.search);
const idOrden = urlParams.get('idOrden');
let rating;
let arrayPresupuestos = [];
let arrayTransportes = [];

$(document).ready(function(){
    let nro = 4 - parseInt(idOrden.length);
    let orden = '0'.repeat(nro);
    $("#titulo").html(`Presupuestos de la orden de transporte #${orden}${idOrden}`);
    $.ajax({
        "method": 'POST',
        "url":"../controllers/presupuestosT/presupuestosTController.php",
        "data":{
            orden_id: idOrden
        }
    }).done(function(resp){
        if(resp === 'null'){
            $('#tablePresupuesto').hide();
            $('#center').prepend(`
            <h4 class="font-strong mt-3">No hay ningun presupuesto todavia.</h4>`);
            $('#presu_D').hide();
        }else{
            cont = 1;
            data = JSON.parse(resp).data;
            console.log(data);
            arrayPresupuestos = data;
            let seleccionado;
            let btn;
            data.forEach(presu => {
                seleccionado = (presu.seleccionado == 'S' ?  `<i class="fa fa-check text-success" aria-hidden="true"></i>` : `<i class="fa fa-times text-danger" aria-hidden="true"></i>`);
                btn = (presu.seleccionado == 'N' ? `<button class="btn btn-success selectBtn" data-toggle="tooltip" data-placement="top" title="" data-original-title="Seleccionar Presupuesto"><i class='fa fa-usd'></i></button>` : `<button class="btn btn-danger unselectBtn" data-toggle="tooltip" data-placement="top" title="" data-original-title="Deseleccionar Presupuesto"><i class='fa fa-usd'></i></button>`);
                $("#tbodyPresupuesto").append(`
                <tr id='${presu.pres_id}' title='Seleccionar presupuesto'>
                    <td>${cont++}</td>
                    <td>${presu.transporte}</td>
                    <td>$${presu.precio}</td>
                    <td>${seleccionado}</td>
                    <td>${btn}</td>
                </tr>`);
            });
        }
    })
    $.ajax({
        "method": 'POST',
        "url":"../controllers/transportes/transportesController.php"
    }).then((resp) => {
        //console.log(JSON.parse(resp).data);
        let data = JSON.parse(resp).data;
        arrayTransportes = data;
        data.forEach(transporte => {
            $('#selectTransporte').append(`
                <option value='${transporte.transporte_id}'>${transporte.nombre}</option>
            `)
        })
    })
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
})

$('#volver').click(function() {
    history.back();
})

let styledStar = `
    .rate {
        float: left;
        height: 46px;
        padding: 0 30%;
    }
    .rate:not(:checked) > input {
        position:absolute;
        top:-9999px;
    }
    .rate:not(:checked) > label {
        float:right;
        width:1em;
        overflow:hidden;
        white-space:nowrap;
        cursor:pointer;
        font-size:30px;
        color:#ccc;
    }
    .rate:not(:checked) > label:before {
        content: '★ ';
    }
    .rate > input:checked ~ label {
        color: #ffc700;    
    }
    .rate:not(:checked) > label:hover,
    .rate:not(:checked) > label:hover ~ label {
        color: #deb217;  
    }
    .rate > input:checked + label:hover,
    .rate > input:checked + label:hover ~ label,
    .rate > input:checked ~ label:hover,
    .rate > input:checked ~ label:hover ~ label,
    .rate > label:hover ~ input:checked ~ label {
        color: #c59b08;
    }`

$('#addPresupuesto').click(function(){

    $('#modal_createPresu').modal('show');
    
})

const setRating = () => {
    rating = parseInt($("#rating input[type='radio']:checked").val());
    let d = new Date();
    $("#ratingFace").attr("src", `/src/${rating}stars.svg?`+d.getTime());
}

$('#addP').click(function(){
    var transporte = $("#selectTransporte option:selected").html();
    var precio = $("#precioP").val();
    console.log(rating);
    if(transporte.length == "Seleccione el transporte" || precio == 0){
        Swal.fire("Atención!", "Campo vacío", "warning");
    }else{
         $.ajax({
            url: '../controllers/presupuestosT/createPresupuestoTController.php',
            type: 'POST',
            data:{
                orden_id: idOrden,
                transporte: transporte,
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
    if(arrayPresupuestos.find(presu => presu.seleccionado === 'S')){
        Swal.fire('No se puede elegir presupuesto!', 'Ya existe uno seleccionado!', 'warning')
        return;
    }
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
                url: '../controllers/presupuestosT/selectPresupuestoTController.php',
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
                            Swal.fire({
                                title: `Valorar a ${name}`,
                                html: `
                                <style>${styledStar}</style>
                                <img id='ratingFace' src='../src/3stars.svg' height='80' alt='rating face'/>
                                <div class="rate" id='rating'>
                                    <input type="radio" id="star5" name="rate" value="5" onClick="setRating()"/>
                                    <label for="star5" title="Excelente">5 stars</label>
                                    <input type="radio" id="star4" name="rate" value="4" onClick="setRating()"/>
                                    <label for="star4" title="Bueno">4 stars</label>
                                    <input type="radio" id="star3" name="rate" value="3" onClick="setRating()"/>
                                    <label for="star3" title="Aceptable">3 stars</label>
                                    <input type="radio" id="star2" name="rate" value="2" onClick="setRating()"/>
                                    <label for="star2" title="Regular">2 stars</label>
                                    <input type="radio" id="star1" name="rate" value="1" onClick="setRating()"/>
                                    <label for="star1" title="Malo">1 star</label>
                                </div>
                                `,
                                focusConfirm: false,
                                confirmButtonText: `
                                    <i class="fa fa-thumbs-up"></i> Guardar valoración
                                `,
                                confirmButtonAriaLabel: "Guardar valoración",
                              }).then(resp => {
                                let proveedor = arrayProveedores.filter(prov => prov.nombre === name)
                                let cantRating = parseInt(proveedor[0].cant_rating) + 1;
                                let acum = parseInt(proveedor[0].acum_rating) + rating;
                                if(resp.isConfirmed){
                                    Swal.fire("Valoración guardada!", "Se guardó la valoración", "success").then(resp =>{
                                        $.ajax({
                                            url: '../controllers/proveedores/valorarProveedoresController.php',
                                            type: 'POST',
                                            data:{
                                                id: proveedor[0].proveedor_id,
                                                acum_rating: acum,
                                                cant_rating: cantRating
                                            }
                                        }).done(function(resp){
                                            console.log(resp);
                                            window.location.reload();
                                        })
                                        
                                    })
                                }
                                if(resp.isDismissed){
                                    if(rating === undefined){
                                        rating = 3;
                                    }
                                    Swal.fire("Valoración guardada!", "Se guardó la valoración", "success").then(resp =>{
                                        $.ajax({
                                            url: '../controllers/proveedores/valorarProveedoresController.php',
                                            type: 'POST',
                                            data:{
                                                id: proveedor[0].proveedor_id,
                                                acum_rating: acum,
                                                cant_rating: cantRating
                                            }
                                        }).done(function(resp){
                                            console.log(resp);
                                            window.location.reload();
                                        })
                                    })
                                }
                            });
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
                url: '../controllers/presupuestosT/selectPresupuestoTController.php',
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
