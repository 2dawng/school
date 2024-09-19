var selectElement = document.querySelector('select[name="lophocphan"]');
var temp = Array.from(selectElement.options);
for (option in temp) {
    if (temp[option].className == "non-completed-subject") {
        temp[option].selected = true;
        document
            .querySelectorAll('input[type="radio"][value="5"]')
            .forEach(function (radioButton) {
                radioButton.checked = true;
            });
        document.querySelector('input[type="radio"][value="4"]').checked = true;
        document.getElementById("btnupdate").click();
        break;
    }
}