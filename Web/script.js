window.setInterval(async () => {
    console.log("Hello world");
    let response = await fetch("button.cgi");
    let text = await response.text();
    console.log(text);
}, 3000);