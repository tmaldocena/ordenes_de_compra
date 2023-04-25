$(document).ready(function() {
    $.ajax({
        "method":"POST",
        "url":"../controllers/ordenes/ordenesController.php"
    }).done(function(resp){
        let data = JSON.parse(resp).data;
        notAuth = data.filter(ord => ord.autorizada === 'NO');
        notPresu = data.filter(ord => ord.presupuesto_id === null || ord.presupuesto_id === 0);
        if(notAuth.length != 0 || notPresu.length != 0){
            showToast();
        }
    });
    showTime();
})


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
