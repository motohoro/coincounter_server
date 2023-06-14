document.querySelectorAll('input').forEach(function (evt) {
    evt.addEventListener('blur', function (evt2) {
        var blurelem = evt2.target.id;
        var number = blurelem.substr(1)
        var tabs = ""
        if (blurelem.startsWith("r")) {
            tabs = "r";
        } else if (blurelem.startsWith("c")) {
            tabs = "c";
        }

        document.querySelectorAll("input[id^='" + blurelem.substr(0, 1) + "'").forEach(function (evt10) {
            var count = document.querySelector("#" + tabs + evt10.id.substr(1)).value
            if (isNaN(Number(evt10.id.substr(1)))) {
                return;
            }

            document.querySelector("#" + tabs + "result" + evt10.id.substr(1)).innerHTML = evt10.id.substr(1) * count
        });

        var coinsum = 0;
        for (let coinkind in coinkinds) {
            coinsum += parseInt(document.querySelector("#" + tabs + "result" + coinkinds[coinkind]).innerHTML)
        }

        var billsum = 0;
        for (let billkind in billkinds) {
            billsum += parseInt(document.querySelector("#" + tabs + "result" + billkinds[billkind]).innerHTML)

        }
        var allsum = coinsum + billsum
        var realsum = allsum + parseInt(document.querySelector("#" + tabs + "calcs").innerHTML)
        var idealsum = parseInt(document.querySelector("#" + tabs + "idealsum").value)
        var marginerror = realsum - idealsum

        document.querySelector("#" + blurelem.substr(0, 1) + "coinsum").innerHTML = coinsum;
        document.querySelector("#" + blurelem.substr(0, 1) + "billsum").innerHTML = billsum;
        document.querySelector("#" + blurelem.substr(0, 1) + "allsum").innerHTML = allsum;
        document.querySelector("#" + blurelem.substr(0, 1) + "realsum").innerHTML = realsum;
        document.querySelector("#" + blurelem.substr(0, 1) + "marginerror").innerHTML = marginerror;



    })
});

document.querySelector("#submitbtn").addEventListener('click',function(){
    this.form.submit();
},false);