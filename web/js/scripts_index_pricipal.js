var btnint=document.getElementById("btnint");
var btnsomos=document.getElementById("btnsomos");
var btndesc=document.getElementById("btndesc");
var btnprfl=document.getElementById("btnprfl");


btnint.addEventListener("click", ()=>{
var intt=document.getElementById("home");
var somos=document.getElementById("somos");
var reffD=document.getElementById("reffD");
var perf=document.getElementById("perf");
if(intt.className=="no"){
    intt.classList.remove("no");
    intt.classList.add("si");
}
if(somos.className=="si"){
    somos.classList.remove("si");
    somos.classList.add("no");
}
if(reffD.className=="si"){
    reffD.classList.remove("si");
    reffD.classList.add("no");
}
if(perf.className=="si"){
    perf.classList.remove("si");
    perf.classList.add("no");
}

});
btnsomos.addEventListener("click", ()=>{
    var intt=document.getElementById("home");
    var somos=document.getElementById("somos");
    var reffD=document.getElementById("reffD");
    var perf=document.getElementById("perf");

    if(somos.className=="no"){
        somos.classList.remove("no");
        somos.classList.add("si");
    }
    if(intt.className=="si"){
        intt.classList.remove("si");
        intt.classList.add("no");
    }
    if(reffD.className=="si"){
        reffD.classList.remove("si");
        reffD.classList.add("no");
    }
    if(perf.className=="si"){
        perf.classList.remove("si");
        perf.classList.add("no");
    }

});
btndesc.addEventListener("click", ()=>{
    var intt=document.getElementById("home");
    var somos=document.getElementById("somos");
    var reffD=document.getElementById("reffD");
    var perf=document.getElementById("perf");

    if(reffD.className=="no"){
        reffD.classList.remove("no");
        reffD.classList.add("si");
    }
    if(intt.className=="si"){
        intt.classList.remove("si");
        intt.classList.add("no");
    }
    if(somos.className=="si"){
        somos.classList.remove("si");
        somos.classList.add("no");
    }
    if(perf.className=="si"){
        perf.classList.remove("si");
        perf.classList.add("no");
    }

});
btnprfl.addEventListener("click", ()=>{
    var intt=document.getElementById("home");
    var somos=document.getElementById("somos");
    var reffD=document.getElementById("reffD");
    var perf=document.getElementById("perf");

    if(perf.className=="no"){
        perf.classList.remove("no");
        perf.classList.add("si");
    }
    if(intt.className=="si"){
        intt.classList.remove("si");
        intt.classList.add("no");
    }
    if(somos.className=="si"){
        somos.classList.remove("si");
        somos.classList.add("no");
    }
    if(reffD.className=="si"){
        reffD.classList.remove("si");
        reffD.classList.add("no");
    }

});