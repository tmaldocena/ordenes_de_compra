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
})

$('#showButton').click(function(){
    if($('#sectorSelect').val() === null || $('#startDate').val() === '' || $('#finalDate').val() === ''){
        Swal.fire("¡Atención!", "No deje campos sin seleccionar", "warning");
    }else{
        $('#resultTable').show('300');
        $('#tableBody').html('');
        $('#totalPrice').html('No hubo gastos');
        let startDate = $('#startDate').val();
        let finalDate = $('#finalDate').val();
        $('#dateReport').html(`Desde: ${startDate} Hasta: ${finalDate}`);
        $.ajax({
            url: '../controllers/ordenesT/ordenesTController.php',
            type: 'POST',
        }).done(function(resp){
            let ordenes = JSON.parse(resp).data;
            console.log(ordenes);
            if(ordenes != undefined){
                ordenes.forEach(orden => {
                    let start = new Date($('#startDate').val());
                    let end = new Date($('#finalDate').val());
                    let fecha = new Date(orden.fecha_transporte);
                    $.ajax({
                        url: "../controllers/presupuestosT/presupuestosTController.php",
                        type: 'POST',
                        data:{
                            orden_id: orden.ordenesT_id
                        }
                    }).done(function(respuesta){
                        //console.log(respuesta);
                        let presu = '';
                        let precio = '';
                        if(respuesta === 'not-found'){
                            precio = '-'
                        }else{
                            presupuestos = JSON.parse(respuesta).data;
                            presu = presupuestos.filter((pres) => pres.seleccionado === "S");
                            console.log(presu);
                            precio = presu[0].precio;
                            transporte = presu[0].transporte
                        }
                        if(fecha >= start && fecha <= end){
                            console.log("entro")
                            let zeroes = 4 - orden.ordenesT_id.length;
                            let ordenNumber = '0'.repeat(zeroes)+orden.ordenesT_id;
                            console.log("orden");
                            $('#tableBody').append(`<tr>
                                <td>#${ordenNumber}</td>
                                <td>${orden.desde}</td>
                                <td>${orden.hasta}</td>
                                <td>${orden.fecha_transporte}</td>
                                <td>${transporte}</td>
                                <td>${precio}</td>
                            </tr>`);
                            var total = 0.0;
                            $('#tableBody tr').each(function() {
                                let fifthCell = $(this).find('td:eq(5)').html();
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