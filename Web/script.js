window.setInterval(async () => {
    console.log("Hello world");
    let response = await fetch("button.cgi");
    let text = await response.text();
    if(text=="checked") {
        document.getElementById("myCheckbox").setAttribute('checked',''); 
    }
    else {
        document.getElementById("myCheckbox").removeAttribute('checked');
    }        
    console.log(text);
}, 3000);