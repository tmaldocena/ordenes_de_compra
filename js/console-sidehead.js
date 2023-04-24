let notAuth = [];
let notPresu = [];

$(document).ready(function() {
    $.ajax({
        "method":"POST",
        "url":"../controllers/role/getRoleController.php",
        data:{
            id: $('#roleID').html()
        },
    }).done(function(resp){
        $('#roleID').html(resp);
    })
    $.ajax({
        "method":"POST",
        "url":"../controllers/ordenes/ordenesController.php"
    }).done(function(resp){
        let data = JSON.parse(resp).data;
        notAuth = data.filter(ord => ord.autorizada === 'NO');
        notPresu = data.filter(ord => ord.presupuesto_id === null || ord.presupuesto_id === 0);
        if(notAuth.length != 0 || notPresu.length != 0){
            showToast();
            $('#notificaciones').append(`<span class="notify-signal"></span>`);
            if(notAuth.length != 0 && notPresu != 0){
                $('#NewMsg').html('');
                $('#NewMsg').append(`<strong>2 Nuevas</strong> Notificaciones`);
                addPresuNotification();
                addAuthNotification();
            }else{
                $('#NewMsg').html('');
                $('#NewMsg').append(`<strong>1 Nueva</strong> Notificación`);
                if(notAuth.length === 0){
                    addPresuNotification();
                }else{
                    addAuthNotification();
                }
            }
        }
    });
    showTime();
})

function getTimeAgo(fechaOrden){
    let today = new Date();
    let fechaO = new Date(fechaOrden);
    let dif = (today.getTime() - fechaO.getTime());
    let maths = Math.round(dif / (1000*60*60));
    if(maths < 24){
        return `Hace ${maths}hrs.`;
    }else{
        maths = Math.round(maths/24);
        return `Hace ${maths} dias`
    }
}

function addAuthNotification(){
    $('#notifList').append(`<div>
                            <a class="list-group-item" href="../../views/ordenes.php">
                                <div class="media">
                                    <div class="media-img">
                                        <span class="badge badge-danger badge-big"><i class="fa fa-user-times"></i></span>
                                    </div>
                                    <div class="media-body">
                                    <div class="font-13">Tienes ${notAuth.length} órdenes sin autorizar</div><small class="text-muted">${getTimeAgo(notAuth[notAuth.length-1].fecha_apertura)}</small></div>
                                </div>
                            </a>
                        </div>
                `)
}

function addPresuNotification(){
    $('#notifList').append(`<div>
                <a class="list-group-item" href="../../views/ordenes.php">
                    <div class="media">
                        <div class="media-img">
                            <span class="badge badge-success badge-big"><i class="fa fa-usd"></i></span>
                        </div>
                        <div class="media-body">
                        <div class="font-13">Tienes ${notPresu.length} órdenes sin presupuestar</div><small class="text-muted">${getTimeAgo(notPresu[notPresu.length-1].fecha_apertura)}</small></div>
                    </div>
                </a>
            </div>
    `)
}

function showTime(){
    var date = new Date();
    var h = date.getHours(); // 0 - 23
    var m = date.getMinutes(); // 0 - 59
    var s = date.getSeconds(); // 0 - 59
    var session = "AM";
    
    if(h == 0){
        h = 12;
    }
    
    if(h > 12){
        h = h - 12;
        session = "PM";
    }
    
    h = (h < 10) ? "0" + h : h;
    m = (m < 10) ? "0" + m : m;
    s = (s < 10) ? "0" + s : s;
    
    var time = h + ":" + m + ":" + s + " " + session;
    document.getElementById("MyClockDisplay").innerText = time;
    document.getElementById("MyClockDisplay").textContent = time;
    
    setTimeout(showTime, 1000);
    
}

function showToast(){
    Toastify({
        text: "Hola! tienes notificaciones pendientes!",
        duration: 2000,
        className: "info bg-teal",
        style: {
            marginTop: "100px"
        }
      }).showToast();
}