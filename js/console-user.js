function verify_user() {
    var username = document.getElementById("user").value;
    var password = document.getElementById("password").value;
    //alert(username + '-' + password);

    if(username.length == 0 || password.length == 0){
        alert("No deje campos vacíos!");
        //! Instalar Sweet Alert
    }

    $.ajax({
        url: '../controllers/user/userController.php',
        type: 'POST',
        data: {
            username: username,
            password: password
        }
    }).done(function(resp){
        var data = JSON.parse(resp);
        if(resp == 0){
            alert("Usuario y/o Contraseña incorrecta");
        }else{
            if(data[0][5] === "ACTIVO"){
                $.ajax({
                    url: '../controllers/user/sessionController.php',
                    type: 'POST',
                    data:{
                        idUser: data[0][0],
                        username: data[0][1],
                        role: data[0][6]
                    }
                }).done(function(resp){
                    let timerInterval
                    Swal.fire({
                        title: 'Bienvenido!',
                        html: 'Redireccionando...',
                        timer: 2000,
                        timerProgressBar: true,
                        didOpen: () => {
                            Swal.showLoading()
                            const b = Swal.getHtmlContainer().querySelector('b')
                            timerInterval = setInterval(() => {
                                b.textContent = Swal.getTimerLeft()
                            }, 100)
                        },
                        willClose: () => {
                            clearInterval(timerInterval)
                        }
                    }).then((result) => {
                        /* Read more about handling dismissals below */
                        if (result.dismiss === Swal.DismissReason.timer) {
                            location.reload();
                        }
                    })
                })
            }else{
                alert("El usuario se encuentra inactivo, comuniquese con el administrador");
            }
        }
    })
}