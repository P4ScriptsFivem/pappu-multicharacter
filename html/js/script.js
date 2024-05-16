var selectedChar = null;
var WelcomePercentage = "30vh"
qbMultiCharacters = {}
var translations = {}
var Loaded = false;
var NChar = null;
var EnableDeleteButton = false;
var dollar = Intl.NumberFormat('en-US');

$(document).ready(function (){
    window.addEventListener('message', function (event) {
        var data = event.data;
        if (data.action == "ui") {
			NChar = data.nChar;
            EnableDeleteButton = data.enableDeleteButton;
            
            translations = data.translations
            if (data.toggle) {
                $('.container').show();
                $(".welcomescreen").fadeIn(150);
                qbMultiCharacters.resetAll();

                var originalText = "Loading.";
                var loadingProgress = 0;
                var loadingDots = 0;
                $("#loading-text").html(originalText);
                var DotsInterval = setInterval(function() {
                    $("#loading-text").append(".");
                    loadingDots++;
                    loadingProgress++;
                    if (loadingProgress == 3) {
                        originalText = "Loading.."
                        $("#loading-text").html(originalText);
                    }
                    if (loadingProgress == 4) {
                        originalText = "Loading.."
                        $("#loading-text").html(originalText);
                    }
                    if (loadingProgress == 6) {
                        originalText = "Loading..."
                        $("#loading-text").html(originalText);
                    }
                    if(loadingDots == 4) {
                        $("#loading-text").html(originalText);
                        loadingDots = 0;
                    }
                }, 500);

                setTimeout(function(){
				
                    $.post('https://pappu-multicharacter/setupCharacters');
                    setTimeout(function(){
                        // clearInterval(DotsInterval);
                        loadingProgress = 0;
                        // originalText = "Retrieving data";
                        $(".welcomescreen").fadeOut(150);
                        qbMultiCharacters.fadeInDown('.characters-list', '80.6%', 1);
                        qbMultiCharacters.fadeInDown('.bar', '79%', 1);
                        qbMultiCharacters.fadeInDown('.bar2', '78.92%', 1);
                        qbMultiCharacters.fadeInDown('.characters-icon', '66.66%', 1);
                        qbMultiCharacters.fadeInDown('.characters-text', '70.26%', 1);
                        qbMultiCharacters.fadeInDown('.characters-text2', '72.66%', 1);
                        $(".btns").css({"display":"flex"});
                        $.post('https://pappu-multicharacter/removeBlur');
                        SetLocal()
                    }, 500);
                }, 2000);
            } else {
                $('.container').fadeOut(250);
                qbMultiCharacters.resetAll();
            }
        }
      
        if (data.action == "setupCharacters") {
            setupCharacters(event.data.characters,event.data.photo1,event.data.photo2,event.data.photo3,event.data.photo4)
        }
    });

    $('.datepicker').datepicker();
});

  

$('.continue-btn').click(function(e){
    e.preventDefault();
});

$('.disconnect-btn').click(function(e){
    e.preventDefault();

    $.post('https://pappu-multicharacter/closeUI');
    $.post('https://pappu-multicharacter/disconnectButton');
});

async function getBase64Image(src, removeImageBackGround, callback, outputFormat) {
    const img = new Image();
    img.crossOrigin = 'Anonymous';
    img.addEventListener("load", () => loadFunc(), false);
    async function loadFunc() {
      const canvas = document.createElement('canvas');
      const ctx = canvas.getContext('2d');
      var convertingCanvas = canvas;
     
        var selectedSize = 320
        canvas.height = selectedSize;
        canvas.width = selectedSize;
        ctx.drawImage(img, 0, 0, selectedSize, selectedSize);
        await removeBackGround(canvas);
        const canvas2 = document.createElement('canvas');
        const ctx2 = canvas2.getContext('2d');
        canvas2.height = 64;
        canvas2.width = 64;
        ctx2.drawImage(canvas, 0, 0, selectedSize, selectedSize, 0, 0, img.naturalHeight, img.naturalHeight);
        convertingCanvas = canvas2;
     
      var dataURL = convertingCanvas.toDataURL(outputFormat);
      canvas.remove();
      convertingCanvas.remove();
      img.remove();
      callback(dataURL);
    };
  
    img.src = src;
    if (img.complete || img.complete === undefined) {
      img.src = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAkCAIAAACIS8SLAAAAKklEQVRIie3NMQEAAAgDILV/55nBww8K0Enq2XwHDofD4XA4HA6Hw+E4Wwq6A0U+bfCEAAAAAElFTkSuQmCC";
      img.src = src;
    }
  }
  async function removeBackGround(sentCanvas) {
    const canvas = sentCanvas;
    const ctx = canvas.getContext('2d');
  
    const net = await bodyPix.load({
      architecture: 'MobileNetV1',
      outputStride: 16,
      multiplier: 0.75,
      quantBytes: 2
    });
       
    const { data:map } = await net.segmentPerson(canvas, {
      internalResolution: 'medium',
    });
  
    const { data:imgData } = ctx.getImageData(0, 0, canvas.width, canvas.height);
  
    const newImg = ctx.createImageData(canvas.width, canvas.height);
    const newImgData = newImg.data;
  
    for (var i=0; i<map.length; i++) {
      const [r, g, b, a] = [imgData[i*4], imgData[i*4+1], imgData[i*4+2], imgData[i*4+3]];
      [
        newImgData[i*4],
        newImgData[i*4+1],
        newImgData[i*4+2],
        newImgData[i*4+3]
      ] = !map[i] ? [255, 255, 255, 0] : [r, g, b, a];
    }
  
    ctx.putImageData(newImg, 0, 0);
  }

  function SetLocal() {
    $(".characters-text").html(translations["characters_header"]);
   }


   function setupCharacters(characters,photo1,photo2,photo3,photo4) {
   

    $(".characters-text2").html(characters.length+'/ '+NChar+" "+ translations["characters_count"]);
    setCharactersList(characters.length)
    $.each(characters, function(index, char){
        //   console.log(char.cid)
        $('#char-'+char.cid).html("");
        $('#char-'+char.cid).data("citizenid", char.citizenid);
        if(char.cid == 1){
            var tempUrl = `https://nui-img/${photo1}/${photo1}?t=${String(Math.round(new Date().getTime() / 1000))}`;
            if (photo1 == undefined|| photo1 == "none") {
                tempUrl = translations["default_image"]; 
             }
        }else if(char.cid == 2){
            var tempUrl = `https://nui-img/${photo2}/${photo2}?t=${String(Math.round(new Date().getTime() / 1000))}`;
            if (photo2 == undefined|| photo2 == "none") {
                tempUrl = translations["default_image"];     
            }
        }else if(char.cid == 3){
            var tempUrl = `https://nui-img/${photo3}/${photo3}?t=${String(Math.round(new Date().getTime() / 1000))}`;
            if (photo3 == undefined|| photo3 == "none") {
                tempUrl = translations["default_image"]; 
            }
        }else if(char.cid == 4){
            var tempUrl = `https://nui-img/${photo4}/${photo4}?t=${String(Math.round(new Date().getTime() / 1000))}`;
            if (photo4 == undefined || photo4 == "none") {
              tempUrl = translations["default_image"];    
            }
        }
        setTimeout(function(){
        if(tempUrl == translations["default_image"]){
            
        
            $('#char-'+char.cid).html('<div class="character-div"><div class="user"> <img src="'+tempUrl +'" alt="'+char.cid +'photo" /></div><span id="slot-name">'+char.charinfo.firstname+' '+char.charinfo.lastname+'<span id="cid">' + char.citizenid + '</span></span><div class="user3"><img  src="' + translations["default_right_image"] + '" alt="plus" /></div></div>  <div class="btns" style=""> <div class="character-btn" id="select" style="display: block;"><p id="select-text"><i "="">'+translations["select"]+'</i></p></div> </div>');
            $('#char-'+char.cid).data('cData', char)
            $('#char-'+char.cid).data('cid', char.cid)
        }else{
            
            getBase64Image(tempUrl, true, function(dataUrl) {
                tempUrl = dataUrl
            $('#char-'+char.cid).html('<div class="character-div"><div class="user"> <img src="'+tempUrl +'" alt="'+char.cid +'photo" /></div><span id="slot-name">'+char.charinfo.firstname+' '+char.charinfo.lastname+'<span id="cid">' + char.citizenid + '</span></span><div class="user3"><img  src="' + translations["default_right_image"] + '" alt="plus" /></div></div>  <div class="btns" style=""> <div class="character-btn" id="select" style="display: block;"><p id="select-text"><i "="">'+translations["select"]+'</i></p></div> </div>');
            $('#char-'+char.cid).data('cData', char)
            $('#char-'+char.cid).data('cid', char.cid)}
            )
        }
        
            
        }, 100)
    })
}

$(document).on('click', '#close-log', function(e){
    e.preventDefault();
    selectedLog = null;
    $('.welcomescreen').css("filter", "none");
    $('.server-log').css("filter", "none");
    $('.server-log-info').fadeOut(250);
    logOpen = false;
});

$(document).on('click', '.character', function(e) {
    var cDataPed = $(this).data('cData');
    e.preventDefault();
    if (selectedChar === null) {
        selectedChar = $(this);
        if ((selectedChar).data('cid') == "") {
            $(selectedChar).addClass("char-selected");
            $("#play-text").html('<i class="fa-solid fa-plus"></i>');
            $("#delete").css({"display":"none"});
            $(this).find(".btns").find(".character-btn").remove()
            $(this).find(".btns").append(' <div class="character-btn" id="play" style="display: block;width: 100%;"><p id="play-text">'+translations["create"]+'</p></div>');
            $.post('https://pappu-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        } else {
            $(selectedChar).addClass("char-selected");
            $(this).find(".btns").find(".character-btn").remove()

            if (EnableDeleteButton) {
                $(this).find(".btns").append(' <div class="character-btn" id="play" style="display: block;"><p id="play-text">'+translations["spawn"]+'</p></div><div class="character-btn" id="delete" style="display: block;"><p id="delete-text">'+translations["delete"]+'</p></div> ');
          
            }else{
                $(this).find(".btns").append(' <div class="character-btn" id="play" style=" display: block;width: 100%;"><p id="play-text">'+translations["spawn"]+'</p></div>');
          
            }
            $("#play-text").html('<i class="">'+translations["spawn"]+'</i>');
            $("#delete-text").html('<i class="">'+translations["delete"]+'</i>');
            $.post('https://pappu-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        }
    } else if ($(selectedChar).attr('id') !== $(this).attr('id')) {
        $(selectedChar).removeClass("char-selected");
        $(selectedChar).find(".btns").find(".character-btn").remove()
       
        $(selectedChar).find(".btns").append('<div class="character-btn" id="select" style="display: block;"><p id="select-text"><i "="">'+translations["select"]+'</i></p></div>');
          
        selectedChar = $(this);
        if ((selectedChar).data('cid') == "") {
            $(selectedChar).addClass("char-selected");
            $("#play-text").html('<i class="fa-solid fa-plus"></i>');
            $(this).find(".btns").find(".character-btn").remove()
            $(this).find(".btns").append('<div class="character-btn" id="play" style=" display: block;width: 100%;"><p id="play-text">'+translations["create"]+'</p></div>');
            $("#delete").css({"display":"none"});
            $.post('https://pappu-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        } else {
            $(selectedChar).addClass("char-selected");
            $(this).find(".btns").find(".character-btn").remove()
            if (EnableDeleteButton) {
                $(this).find(".btns").append(' <div class="character-btn" id="play" style="display: block;"><p id="play-text">'+translations["spawn"]+'</p></div><div class="character-btn" id="delete" style="display: block;"><p id="delete-text">'+translations["delete"]+'</p></div> ');
            }else{
                $(this).find(".btns").append(' <div class="character-btn" id="play" style="display: block;width: 100%;"><p id="play-text">'+translations["spawn"]+'</p></div>');
          
            }
               
            $("#play-text").html('<i class="">'+translations["spawn"]+'</i>');
        
            $("#delete-text").html('<i ">'+translations["delete"]+'</i>');
            $.post('https://pappu-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        }
    }
});

var entityMap = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;',
    '/': '&#x2F;',
    '': '&#x60;',
    '=': '&#x3D;'
};

function escapeHtml(string) {
    return String(string).replace(/[&<>"'=/]/g, function (s) {
        return entityMap[s];
    });
}
function hasWhiteSpace(s) {
    return /\s/g.test(s);
}

$(document).on('click', '#create', function (e) {
    e.preventDefault();
   
    let firstname= $.trim(escapeHtml($('#first_name').val()))
    let lastname= $.trim(escapeHtml($('#last_name').val()))
    let nationality= $.trim(escapeHtml($('#nationality').val()))
    let birthdate= $.trim(escapeHtml($('#birthdate').val()))
    let gender= $.trim(escapeHtml($('input[name=radio]:checked').val()))
  
    let cid = $.trim(escapeHtml($(selectedChar).attr('id').replace('char-', '')))

    if (!firstname || !lastname || !nationality || !birthdate){
        var reqFieldErr = '<p>'+translations["missing_information"]+'</p>'
        $('.error-msg').html(reqFieldErr)
        $('.error-title').html('<span class="material-symbols-outlined">'+translations["error_title"]+'</span>Error!')
        $('#cancel-error').html(translations["close"])
        
        $('.error').fadeIn(400)

        return false;
    }

    $.post('https://pappu-multicharacter/createNewCharacter', JSON.stringify({
        firstname: firstname,
        lastname: lastname,
        nationality: nationality,
        birthdate: birthdate,
        gender: gender,
        cid: cid,
    }));
    $(".container").fadeOut(150);
    $('.characters-list').css("filter", "none");
    $('.character-info').css("filter", "none");


    qbMultiCharacters.fadeOutDown('.character-register', '35%', 1);
    refreshCharacters()

});

$(document).on('click', '#accept-delete', function(e){
    $.post('https://pappu-multicharacter/removeCharacter', JSON.stringify({
        citizenid: $(selectedChar).data("citizenid"),
    }));
    $('.character-delete').fadeOut(150);
    $('.characters-block').css("filter", "none");
    refreshCharacters();
});

$(document).on('click', '#cancel-delete', function(e){
    e.preventDefault();
    $('.characters-block').css("filter", "none");
    $('.character-delete').fadeOut(150);
});

$(document).on('click', '#close-error', function(e){
    e.preventDefault();
    $('.characters-block').css("filter", "none");
    $('.error').fadeOut(150);
});

function setCharactersList(max) {
    
    var htmlResult = '<div class="character-list-header"></div>'
    htmlResult += '<div class="characters">'
    if(max >= NChar) max = NChar-1
    for (let i = 1; i <= max+1; i++) {
        htmlResult += '<div class="character" id="char-'+ i +'" data-cid=""><div class="character-div"><div class="user2"><img  src="image/action_dot.gif" alt="plus" /></div><span id="slot-name">'+translations["create_new_character"]+'<span id="cid"></span></span><div class="user2"><img  src="image/action_dot.gif" alt="plus" /></div></div><div class="btns" style=""> <div class="character-btn" id="select" style="display: block;"><p id="select-text"><i "="">'+translations["select"]+'</i></p></div> </div> </div>'
    }
    htmlResult += '</div>'
    $('.characters-list').html(htmlResult)
}

function refreshCharacters() {
    var htmlResult = ''
    for (let i = 1; i <= NChar; i++) {
        htmlResult += '<div class="character" id="char-'+ i +'" data-cid=""><div class="character-div"><div class="user2"><img  src="image/action_dot.gif" alt="plus" /></div><span id="slot-name">'+translations["create_new_character"]+'<span id="cid"></span></span><div class="user2"><img  src="image/action_dot.gif" alt="plus" /></div></div><div class="btns" style=""> <div class="character-btn" id="select" style="display: block;"><p id="select-text"><i "="">'+translations["select"]+'</i></p></div> </div> </div>'
    }

    $('.characters-list').html(htmlResult)

    
    setTimeout(function(){
        $(selectedChar).removeClass("char-selected");
        selectedChar = null;
        $.post('https://pappu-multicharacter/setupCharacters');
        $("#delete").css({"display":"none"});
        $("#play").css({"display":"none"});
        qbMultiCharacters.resetAll();
    }, 100)
}

$("#close-reg").click(function (e) {
    e.preventDefault();
    $('.error').fadeOut(150);
    $('.characters-list').css("filter", "none")
    $('.character-info').css("filter", "none")
    qbMultiCharacters.fadeOutDown('.character-register', '20%', 1);
    qbMultiCharacters.OpenAll();
})

$("#close-del").click(function (e) {
    e.preventDefault();
    $('.characters-block').css("filter", "none");
    $('.character-delete').fadeOut(150);
})

$(document).on('click', '#play', function(e) {
    e.preventDefault();
    var charData = $(selectedChar).data('cid');

    if (selectedChar !== null) {
        if (charData !== "") {
            $.post('https://pappu-multicharacter/selectCharacter', JSON.stringify({
                cData: $(selectedChar).data('cData')
            }));
            setTimeout(function(){
                qbMultiCharacters.fadeOutDown('.characters-list', "-40%", 1);
                qbMultiCharacters.fadeOutDown('.bar', "-40%", 1);
                qbMultiCharacters.fadeOutDown('.bar2', "-40%", 1);
                qbMultiCharacters.fadeOutDown('.characters-icon', "-40%", 1);
                qbMultiCharacters.fadeOutDown('.characters-text', "-40%", 1);
                qbMultiCharacters.fadeOutDown('.characters-text2', "-40%", 1);
                qbMultiCharacters.fadeOutDown('.character-info', "-40%", 1);
                qbMultiCharacters.resetAll();
            }, 1500);
        } else {
            $('.characters-list').css("filter")
            $('.bar').css("filter")
            $('.bar2').css("filter")
            $('.characters-icon').css("filter")
            $('.characters-text').css("filter")
            $('.characters-text2').css("filter")
            $('.character-info').css("filter")
           
      $(".characters-register-block-header").html('<p>'+translations["create_header"]+'</p>');
      $(".char-register-text").html(translations["header_detail"]);
      
      $(".char-register-inputs").html('<div class="input-div"><i class="fa-solid fa-address-card adress-icon" aria-hidden="true"></i><input type="text" id="first_name" placeholder="'+translations["create_firstname"]+'" class="char-reg-input"></div>'
     +'<div class="input-div"><i class="fa-solid fa-address-card adress-icon" aria-hidden="true"></i><input type="text" id="last_name" placeholder="'+translations["create_lastname"]+'" class="char-reg-input"></div>'
     +'<div class="input-div"><i class="fa-solid fa-globe nationality-icon"></i><input type="text" id="nationality" style="color: rgb(255, 255, 255);" placeholder="'+translations["create_nationality"]+'" class="char-reg-inputt2"></div>'
     +'<div class="mydict2">'+translations["gender_marker"]+'</div>'
     +'<div class="mydict"> <label> <input type="radio" name="radio" value="'+translations["male"]+'" checked="checked"><span><p>'+translations["male"]+'</p></span></label><label>'
    +'<input type="radio" name="radio" value="'+translations["female"]+'"><span><p>'+translations["female"]+'</p></span> </label></div>');

 $(".char-register-inputsss").html('<div class="input-div2"><i class="fa-solid fa-calendar calendar-icon"></i><input type="date" id="birthdate" style="color: rgb(255, 255, 255);" placeholder="'+translations["create_birthday"]+'" value="2005-05-05" min="1900-01-01" max="2023-12-31" class="char-reg-input"></div>');
      
    $("#create-text").html(translations["confirm"]);
    $("#close-reg").html('<p>'+translations["cancel"]+'</p>');
            qbMultiCharacters.fadeInDown('.character-register', '20%', 1);
            qbMultiCharacters.closeAll();
        }
    }
});

$(document).on('click', '#delete', function(e) {
    e.preventDefault();
    var charData = $(selectedChar).data('cid');

    if (selectedChar !== null) {
        if (charData !== "") {
            $('.characters-block').css("filter")
            $('.character-delete').fadeIn(250);
           
            $("#accept-delete").html('<p id="accept-text">'+translations["confirm"]+'</p>');
            $("#cancel-delete").html('<p id="cancel-text">'+translations["cancel"]+'</p>');
        }
    }
});

qbMultiCharacters.fadeOutUp = function(element, time) {
    $(element).css({"display":"block"}).animate({top: "-80.5%",}, time, function(){
        $(element).css({"display":"none"});
    });
}

qbMultiCharacters.fadeOutDown = function(element, percent, time) {
    if (percent !== undefined) {
        $(element).css({"display":"block"}).animate({top: percent,}, time, function(){
            $(element).css({"display":"none"});
        });
    } else {
        $(element).css({"display":"block"}).animate({top: "103.5%",}, time, function(){
            $(element).css({"display":"none"});
        });
    }
}

qbMultiCharacters.fadeInDown = function(element, percent, time) {
    $(element).css({"display":"block"}).animate({top: percent,}, time);
}

qbMultiCharacters.closeAll = function() {
    $('.characters-list').hide();
    $('.bar').hide();
    $('.bar2').hide();
    $('.characters-text').hide();
    $('.characters-text2').hide();
    $('.characters-icon').hide();
    $('.character-info').hide();
    selectedChar = null;

}
qbMultiCharacters.OpenAll = function() {
    $('.characters-list').show();
    $('.bar').show();
    $('.bar2').show();
    $('.characters-text').show();
    $('.characters-text2').show();
    $('.characters-icon').show();
    $('.character-info').show();
   

}
qbMultiCharacters.resetAll = function() {
    $('.characters-list').hide();
    $('.characters-list').css("top", "-40");
    $('.bar').hide();
    $('.bar').css("top", "-40");
    $('.bar2').hide();
    $('.bar2').css("top", "-40");
    $('.characters-text').hide();
    $('.characters-text').css("top", "-40");
    $('.characters-text2').hide();
    $('.characters-text2').css("top", "-40");
    $('.characters-icon').hide();
    $('.characters-icon').css("top", "-40");
    $('.character-info').hide();
    $('.character-info').css("top", "-40");
    $('.welcomescreen').css("top", WelcomePercentage);
    $('.server-log').show();
    $('.server-log').css("top", "25%");
    selectedChar = null;
}
