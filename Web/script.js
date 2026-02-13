console.log("Hello from script.js");

window.addEventListener(('load'), (event) => {

    window.setInterval(
        (async () => {
            console.log("Hello from timer.js");
            let response = await fetch("button.cgi");
            let text = await response.text();
            console.log(text);
            let checkbox = document.getElementById("checkbox-id");
            if (text == "checked") {
                checkbox.setAttribute("checked", "");
            }
            else {
                checkbox.removeAttribute("checked");
            }
        }), 3000);


    document.getElementById("toggle-button").onclick = async () => {
        let response = await fetch("demo.cgi",
            {
                method: "POST",
                headers: {
                    //'Content-Type': 'application/json'
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: "toggle-button=true"
            });
        let txt = await response.text();
        console.log(txt);
    };

});