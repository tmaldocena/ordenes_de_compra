var table;
var sectorN = '';
var idOrdenUpdate;
var sectores;
$(document).ready(function () {
    $('#tabla_ordenes').DataTable();
    listar_ordenes();
    $.ajax({
        "method":"POST",
        "url":"../controllers/sectores/sectoresController.php"
    }).done(function(resp){
        sectores = JSON.parse(resp).data;
        sectores.forEach(sector => {
            $('#selectSector').append(`<option value='${sector.sector_id}'>${sector.nombre}</option>`);
            $('#selectSectorEdit').append(`<option value='${sector.sector_id}'>${sector.nombre}</option>`);
        });
    });
    $('#selectSector').select2({
        minimumResultsForSearch: Infinity
    });
    $('.dataTables_filter input[type="search"]').attr('placeholder','Buscar orden...').css({'width':'350px','display':'inline-block'});
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
                    if(data === '0' || data === null){
                        return `<i class="fa fa-times text-danger" aria-hidden="true"></i>`;
                    }else{
                        return `<i class="fa fa-check text-success" aria-hidden="true"></i>`;
                    }
                }
            },
            {"defaultContent":`<div class="btn-group m-b-10">
            <button class="btn btn-success presupuestoBtn" data-toggle="tooltip" data-placement="top" title="" data-original-title="Ver Presupuestos"><i class='fa fa-usd'></i></button>
            <button class="btn btn-info editBtn"><i class='fa fa-edit' data-toggle="tooltip" data-placement="top" title="" data-original-title="Editar Orden"></i></button>
            <button class="btn btn-danger deleteBtn"><i class='fa fa-trash' data-toggle="tooltip" data-placement="top" title="" data-original-title="Eliminar Orden"></i></button>
            </div>`}
        ],
        "language":idioma_espanol,
        select: true
	});
    $("#tabla_ordenes_filter").css('float', 'left');
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
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

$('#modal_createOrden').on('shown.bs.modal', function () {
        $('#ordenName').trigger('focus')
})

$('#AddOrden').click(function() {
    $('#modal_createOrden').modal('show');
})

$(document).on('click', '#createOrden', function(){
    var name = $("#ordenName").val();
    var cant = $("#ordenCant").val();
    var sector = $("#selectSector option:selected").val();
    var checkAuth = $("#authorizedCheck").is(":checked");
    console.log(name, cant, sector, checkAuth);
    if(name.length == 0 || cant == 0 || sector === '0'){
        Swal.fire("Atención!", "Campo vacío", "warning");
        $('#modal_createOrden').modal('hide');
    }else{
         $.ajax({
            url: '../controllers/ordenes/createOrdenController.php',
            type: 'POST',
            data:{
                nombre: name,
                cantidad: cant,
                sector: sector,
                autorizada: (checkAuth ? 'SI' : 'NO')
            }
        }).done(function(resp){
            if(resp > 0){
                if(resp == 1){
                    table.ajax.reload();
                    Swal.fire("Registrado Correctamente", "Orden creada exitosamente", "success");
                    $('#modal_createOrden').modal('hide');
                }else{
                    Swal.fire("Error al registrar", "Ya existe ese nombre en un rol", "warning");
                }
            }else{
                Swal.fire("Error al registrar", "No se pudo completar la operación", "error");
            }
        })
    }
})

$(document).on('click', '#updateOrden', function(){
    var name = $("#ordenNameEdit").val();
    var cant = $("#ordenCantEdit").val();
    var sector = $("#selectSectorEdit option:selected").val();
    var checkAuth = $("#authorizedCheckEdit").is(":checked");
    console.log(name, cant, sector, checkAuth);
    if(name.length == 0 || cant == 0 || sector === '0'){
        Swal.fire("Atención!", "Campo vacío", "warning");
        $('#modal_editOrden').modal('hide');
    }else{
         $.ajax({
            url: '../controllers/ordenes/updateOrdenController.php',
            type: 'POST',
            data:{
                id: idOrdenUpdate,
                nombre: name,
                cantidad: cant,
                sector: sector,
                autorizada: (checkAuth ? 'SI' : 'NO')
            }
        }).done(function(resp){
            if(resp > 0){
                if(resp == 1){
                    table.ajax.reload();
                    Swal.fire("Actualizado Correctamente", "Orden actualizada exitosamente", "success");
                    $('#modal_editOrden').modal('hide');
                }else{
                    Swal.fire("Error al registrar", "Ya existe ese nombre en un rol", "warning");
                }
            }else{
                Swal.fire("Error al registrar", "No se pudo completar la operación", "error");
            }
        })
    }
})

$("#tabla_ordenes").on("click", ".editBtn", function(){
    var data = table.row($(this).parents('tr')).data();
    idOrdenUpdate = data.orden_id;
    if(table.row(this).child.isShown()){
        var data = table.row(this).data();
    }
    $('#ordenNameEdit').val(data.nombre);
    $('#ordenCantEdit').val(data.cantidad);
    $('#selectSectorEdit').val(data.sectorID);
    if(data.autorizada === "SI"){
        $('#authorizedCheckEdit').prop('checked', true);;
    }else{
        $('#authorizedCheckEdit').prop('checked', false);;
    }
    $('#modal_editOrden').modal('show');
})

$('#tabla_ordenes').on('click', '.deleteBtn', function(){
    var data = table.row($(this).parents('tr')).data();
    idOrdenUpdate = data.orden_id;
    Swal.fire({
        title: 'Estás seguro?',
        text: "Se eliminará la orden seleccionada!",
        icon: 'warning',
        showCancelButton: true,
        cancelButtonText: 'Cancelar',
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, eliminar orden!'
      }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: '../controllers/ordenes/deleteOrdenController.php',
                type: 'POST',
                data:{
                    id: idOrdenUpdate,
                }
            }).done(function(resp){
                if(resp > 0){
                    if(resp == 1){
                        table.ajax.reload();
                        Swal.fire('Eliminada exitosamente!', 'Se eliminó la orden de compra seleccionada.', 'success');
                    }
                }else{
                    Swal.fire("Error al registrar", "No se pudo completar la operación", "error");
                }
            });
        }else{
            Swal.fire('Operación cancelada!', 'No se eliminó la orden seleccionada.', 'warning')
        }
        })
})

$('#tabla_ordenes').on('click', '.presupuestoBtn', function(){
    var data = table.row($(this).parents('tr')).data();
    idOrdenPresupuesto = data.orden_id;
    window.location.href = `../../views/presupuestos.php?idOrden=${idOrdenPresupuesto}`;
})

// ========== BULK UPLOAD LOGIC ==========
var bulkState = {
    rawData: [],
    columns: [],
    mapping: { nombre: '', cantidad: '', sector: '', autorizada: '' },
    step: 1,
    currentFile: null
};

var BULK_FIELDS = ['nombre', 'cantidad', 'sector', 'autorizada'];
var BULK_FIELD_LABELS = { nombre: 'Nombre', cantidad: 'Cantidad', sector: 'Sector', autorizada: 'Autorizada' };
var BULK_AUTO_MATCH = {
    nombre: ['nombre', 'name', 'producto', 'articulo', 'artículo', 'descripcion', 'descripción', 'item', 'product'],
    cantidad: ['cantidad', 'quantity', 'cant', 'qty', 'count', 'amount'],
    sector: ['sector', 'departamento', 'area', 'área', 'dept', 'department'],
    autorizada: ['autorizada', 'autorizado', 'authorized', 'auth', 'aprobada', 'aprobado', 'approved']
};

function resetBulkState(){
    bulkState = {
        rawData: [],
        columns: [],
        mapping: { nombre: '', cantidad: '', sector: '', autorizada: '' },
        step: 1,
        currentFile: null
    };
}

function goBulkStep(step){
    bulkState.step = step;
    $('.bulk-step').hide();
    $(`.bulk-step-${step}`).show();

    $('.bulk-step-indicator').removeClass('badge-primary').addClass('badge-secondary');
    $(`#step${step}Indicator`).removeClass('badge-secondary').addClass('badge-primary');

    $('#bulkBackBtn').toggle(step > 1);
    $('#bulkNextBtn').hide();
    $('#bulkImportBtn').hide();

    if(step === 1){
        $('#bulkNextBtn').prop('disabled', true).text('Siguiente').show();
        checkBulkStep1();
    } else if(step === 2){
        $('#bulkNextBtn').prop('disabled', true).text('Siguiente').show();
        checkBulkStep2();
    } else if(step === 3){
        $('#bulkImportBtn').show();
    }
}

function checkBulkStep1(){
    $('#bulkNextBtn').prop('disabled', !bulkState.currentFile);
}

function checkBulkStep2(){
    var required = ['nombre', 'cantidad', 'sector'];
    var ok = true;
    required.forEach(function(f){
        if(!bulkState.mapping[f]) ok = false;
    });
    $('#bulkNextBtn').prop('disabled', !ok);
    if(!ok){
        $('#bulkMappingError').show().text('Debes asignar los campos requeridos (Nombre, Cantidad, Sector).');
    } else {
        $('#bulkMappingError').hide();
    }
}

function buildMappingDropdowns(){
    var cols = bulkState.columns;
    BULK_FIELDS.forEach(function(field){
        var $select = $(`.bulk-mapping-select[data-field="${field}"]`);
        $select.empty();
        $select.append(`<option value="">─ ignorar ─</option>`);
        cols.forEach(function(col){
            $select.append(`<option value="${col}">${col}</option>`);
        });
        // Auto-detect
        var match = null;
        var lower = field.toLowerCase();
        var keywords = BULK_AUTO_MATCH[field] || [];
        cols.forEach(function(col){
            var cl = col.toLowerCase().trim();
            if(keywords.indexOf(cl) >= 0){
                match = col;
            }
        });
        if(match){
            $select.val(match);
            bulkState.mapping[field] = match;
        } else {
            bulkState.mapping[field] = '';
        }
    });
}

function generatePreview(){
    var map = bulkState.mapping;
    var data = bulkState.rawData;
    var $tbody = $('#bulkPreviewBody');
    $tbody.empty();

    var validCount = 0;
    var errorCount = 0;

    data.forEach(function(row, idx){
        var nombre = map.nombre ? (row[map.nombre] || '').toString().trim() : '';
        var cantidad = map.cantidad ? (row[map.cantidad] || '').toString().trim() : '';
        var sector = map.sector ? (row[map.sector] || '').toString().trim() : '';
        var autorizada = map.autorizada ? (row[map.autorizada] || '').toString().trim() : '';

        var errors = [];
        if(!nombre) errors.push('Nombre vacío');
        if(!cantidad || isNaN(cantidad) || Number(cantidad) <= 0) errors.push('Cantidad inválida');
        if(!sector) errors.push('Sector vacío');
        var sectorOk = false;
        if(sectores && sectores.length){
            sectorOk = sectores.some(function(s){
                return s.nombre.localeCompare(sector, 'es', { sensitivity: 'base' }) === 0;
            });
        }
        if(sector && !sectorOk) errors.push('Sector no reconocido');

        if(errors.length === 0) validCount++;
        else errorCount++;

        var statusClass = errors.length === 0 ? 'text-success' : 'text-danger';
        var statusIcon = errors.length === 0 ? 'fa-check-circle' : 'fa-exclamation-circle';

        $tbody.append(`
            <tr class="${errors.length > 0 ? 'table-danger' : ''}">
                <td>${idx + 1}</td>
                <td>${nombre || '<span class="text-muted">—</span>'}</td>
                <td>${cantidad || '<span class="text-muted">—</span>'}</td>
                <td>${sector || '<span class="text-muted">—</span>'}</td>
                <td>${autorizada || 'NO'}</td>
                <td><i class="fa ${statusIcon} ${statusClass}"></i> ${errors.join(', ') || 'Correcto'}</td>
            </tr>
        `);
    });

    $('#bulkPreviewCount').text(data.length);
    var summary = '';
    if(validCount > 0) summary += `<span class="text-success"><i class="fa fa-check-circle"></i> ${validCount} filas válidas</span>`;
    if(errorCount > 0) summary += ` <span class="text-danger ml-3"><i class="fa fa-exclamation-circle"></i> ${errorCount} filas con errores</span>`;
    $('#bulkSummary').html(summary);
    $('#bulkImportBtn').prop('disabled', validCount === 0);
}

function getMappedData(){
    var map = bulkState.mapping;
    return bulkState.rawData.map(function(row){
        var obj = {};
        obj.nombre = map.nombre ? (row[map.nombre] || '').toString().trim() : '';
        obj.cantidad = map.cantidad ? (row[map.cantidad] || '').toString().trim() : '';
        obj.sector = map.sector ? (row[map.sector] || '').toString().trim() : '';
        obj.autorizada = map.autorizada ? (row[map.autorizada] || '').toString().trim() : '';
        return obj;
    }).filter(function(row){
        return row.nombre && row.cantidad && row.sector;
    });
}

$(document).on('click', '#BulkUploadBtn', function(){
    resetBulkState();
    $('#bulkFileInput').val('');
    $('#bulkFileLabel').text('Seleccionar archivo...');
    $('#bulkFileInfo').hide();
    goBulkStep(1);
    $('#modal_bulkUpload').modal('show');
});

$(document).on('change', '#bulkFileInput', function(e){
    var file = e.target.files[0];
    if(!file) return;
    bulkState.currentFile = file;
    $('#bulkFileLabel').text(file.name);
    $('#bulkFileInfo').show().text('Leyendo archivo...');

    var reader = new FileReader();
    reader.onload = function(ev){
        try {
            var raw = ev.target.result;
            var isCsv = file.name.match(/\.csv$/i);
            if(isCsv && typeof TextDecoder !== 'undefined'){
                var text = new TextDecoder('UTF-8').decode(raw);
                raw = text;
            }
            var wb = XLSX.read(raw, {type: isCsv ? 'string' : 'array'});
            var ws = wb.Sheets[wb.SheetNames[0]];
            var json = XLSX.utils.sheet_to_json(ws, {defval: ''});

            if(!json || json.length === 0){
                Swal.fire('Error', 'El archivo no contiene datos', 'error');
                $('#bulkFileInfo').hide();
                checkBulkStep1();
                return;
            }

            bulkState.rawData = json;
            bulkState.columns = Object.keys(json[0]);
            $('#bulkFileInfo').text('✓ ' + json.length + ' filas detectadas en ' + file.name);
            $('#bulkNextBtn').prop('disabled', false);
        } catch(err){
            Swal.fire('Error', 'No se pudo leer el archivo: ' + err.message, 'error');
            $('#bulkFileInfo').hide();
            checkBulkStep1();
        }
    };
    reader.readAsArrayBuffer(file);
});

$(document).on('click', '#bulkNextBtn', function(){
    if(bulkState.step === 1){
        buildMappingDropdowns();
        goBulkStep(2);
    } else if(bulkState.step === 2){
        generatePreview();
        goBulkStep(3);
    }
});

$(document).on('click', '#bulkBackBtn', function(){
    if(bulkState.step === 2){
        goBulkStep(1);
    } else if(bulkState.step === 3){
        goBulkStep(2);
    }
});

$(document).on('change', '.bulk-mapping-select', function(){
    var field = $(this).data('field');
    bulkState.mapping[field] = $(this).val();
    checkBulkStep2();
});

$(document).on('click', '#bulkImportBtn', function(){
    var data = getMappedData();
    if(data.length === 0){
        Swal.fire('Atención', 'No hay datos válidos para importar', 'warning');
        return;
    }

    var btn = $(this);
    btn.prop('disabled', true);
    $('#bulkSpinner').show();

    $.ajax({
        url: '../controllers/ordenes/bulkCreateOrdenController.php',
        type: 'POST',
        data: { data: JSON.stringify(data) }
    }).done(function(resp){
        $('#bulkSpinner').hide();
        var result;
        try {
            result = JSON.parse(resp);
        } catch(e){
            Swal.fire('Error', 'Respuesta inválida del servidor', 'error');
            btn.prop('disabled', false);
            return;
        }

        var msg = `<b>${result.success} órdenes importadas correctamente.</b>`;
        if(result.errors && result.errors.length > 0){
            msg += `<br><br><b>Errores (${result.errors.length}):</b><br>` + result.errors.join('<br>');
        }

        Swal.fire({
            title: result.errors && result.errors.length > 0 ? 'Importación parcial' : 'Importación exitosa',
            html: msg,
            icon: result.errors && result.errors.length > 0 ? 'warning' : 'success',
            confirmButtonText: 'Aceptar'
        }).then(function(){
            $('#modal_bulkUpload').modal('hide');
            table.ajax.reload();
        });
    }).fail(function(){
        $('#bulkSpinner').hide();
        Swal.fire('Error', 'Error de conexión con el servidor', 'error');
        btn.prop('disabled', false);
    });
});

$(document).on('click', '#downloadTemplateBtn', function(e){
    e.preventDefault();
    var template = XLSX.utils.aoa_to_sheet([
        ['Nombre', 'Cantidad', 'Sector', 'Autorizada'],
        ['Resma A4 75gr', '50', 'Administración', 'SI'],
        ['Toner HP 85A', '10', 'Mantenimiento', 'NO'],
        ['Guantes de seguridad', '100', 'Producción', 'SI']
    ]);
    var wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, template, 'Ordenes');
    XLSX.writeFile(wb, 'template_ordenes.xlsx');
});

$('#modal_bulkUpload').on('hidden.bs.modal', function(){
    resetBulkState();
});

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
    case '8':
        return 'Arquitecto'
        break;
    case '9':
        return 'Talento Humano'
        break;
    default:
        break;
}
}


