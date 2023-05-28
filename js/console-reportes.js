$(document).ready(function(){
    const options = { 
        timeZone: 'America/Argentina/Buenos_Aires', 
        month: '2-digit', 
        day: '2-digit',
        year: 'numeric' 
    };
    const date = new Date().toLocaleDateString('en-US', options);
    console.log(date);
    const today = new Date(date);
    console.log(today)
    //let today = today.getMonth() + '-' + today.getDay() + '-' + today.getFullYear();
    $('#finalDate').val(date);
    $('#resultTable').hide();
    $('#datepicker').datepicker({
        format: 'mm-dd-yyyy',
        language: 'es'
    });
    let sectores;
    $.ajax({
        "method":"POST",
        "url":"../controllers/sectores/sectoresController.php"
    }).done(function(resp){
        sectores = JSON.parse(resp).data;
        sectores.forEach(sector => {
            $('#sectorSelect').append(`<option value='${sector.sector_id}'>${sector.nombre}</option>`);
        });
    });
    $('#sectorSelect').select2({
        minimumResultsForSearch: Infinity
    });
})

$('#showButton').click(function(){
    if($('#sectorSelect').val() === null || $('#startDate').val() === '' || $('#finalDate').val() === ''){
        Swal.fire("¡Atención!", "No deje campos sin seleccionar", "warning");
    }else{
        $('#resultTable').show('300');
        $('#tableBody').html('');
        $('#totalPrice').html('No hubo gastos');
        let sectorName = $('#sectorSelect');
        sectorName = sectorName[0].selectedOptions[0].innerHTML;
        let startDate = $('#startDate').val();
        let finalDate = $('#finalDate').val();
        $('#sectorReport').html(`Sector: ${sectorName}`);
        $('#dateReport').html(`Desde: ${startDate} Hasta: ${finalDate}`);
        $.ajax({
            url: '../controllers/ordenes/filterOrdenController.php',
            type: 'POST',
            data:{
                sectorID: $('#sectorSelect').val()
            }
        }).done(function(resp){
            let ordenes = JSON.parse(resp).data;
            if(ordenes != undefined){
                ordenes.forEach(orden => {
                    let start = new Date($('#startDate').val());
                    let end = new Date($('#finalDate').val());
                    let fecha = new Date(orden.fecha_apertura);
                    $.ajax({
                        url:'../controllers/presupuestos/filterPresupuestoController.php',
                        type: 'POST',
                        data:{
                            presupuestoID: orden.presupuesto_id
                        }
                    }).done(function(respuesta){
                        let presu = '';
                        let precio = '';
                        if(respuesta === 'not-found'){
                            precio = '-'
                        }else{
                            presu = JSON.parse(respuesta).data[0];
                            precio = presu.precio;
                        }
                        if(fecha >= start && fecha <= end){
                            let zeroes = 4 - orden.orden_id.length;
                            let ordenNumber = '0'.repeat(zeroes)+orden.orden_id;
                            $('#tableBody').append(`<tr>
                                <td>#${ordenNumber}</td>
                                <td>${orden.nombre}</td>
                                <td>${orden.cantidad}</td>
                                <td>${orden.fecha_apertura}</td>
                                <td id='${presu.pres_id}'>${precio}</td>
                            </tr>`);
                            var total = 0.0;
                            $('#tableBody tr').each(function() {
                                let fifthCell = $(this).find('td:eq(4)').html();
                                console.log(fifthCell);
                                if(fifthCell !== '-' ){
                                    total += parseFloat(fifthCell);
                                    console.log(total);
                                }
                            });
                            $('#totalPrice').html('Total gastado: $'+ (total === NaN ? '0' : total));
                        }
                    })
                });
            }
        });
    }
})

function printContent(el){
    var restorepage = $('body').html();
    var printcontent = $('#' + el).clone();
    $('body').empty().html(printcontent);
    $('#printButton').hide();
    window.print();
    $('body').html(restorepage);
    $('#printButton').show();
    window.location.reload();
    }