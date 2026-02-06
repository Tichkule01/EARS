<%-- 
    Document   : jssuggestion
    Created on : Sep 17, 2025, 12:53:38 PM
    Author     : plazma
--%>

    <style>
        #suggestionBox {
            border: 1px solid #ccc;
            max-height: 150px;
            overflow-y: auto;
            width: 200px;
            background: white;
            position: absolute;
            display: none; /* hide initially */
            z-index: 1000;
        }
        .suggest-item {
            padding: 5px;
            cursor: pointer;
        }
        .suggest-item:hover {
            background: #f0f0f0;
        }
    </style>
<script>
function filterSuggestions(inputId, boxId) {
    let input = document.getElementById(inputId).value.toLowerCase().trim();
    let box = document.getElementById(boxId);
    let items = box.querySelectorAll(".suggest-item");

    if (input === "") {
        box.style.display = "none"; // hide if input is empty
        return;
    }

    let hasMatch = false;
    items.forEach(function(item){
        if(item.textContent.toLowerCase().includes(input)) {
            item.style.display = "block";
            hasMatch = true;
        } else {
            item.style.display = "none";
        }
    });

    box.style.display = hasMatch ? "block" : "none";
}

function selectSuggestion(inputId, value) {
    document.getElementById(inputId).value = value;
    let boxId = inputId === 'NAME' ? 'suggestionBox' : 'suggestionBox1';
    document.getElementById(boxId).style.display = 'none';
}

// Hide all suggestions when clicking outside
document.addEventListener("click", function(e){
    if (!e.target.matches("input")) {
        document.getElementById("suggestionBox").style.display='none';
        document.getElementById("suggestionBox1").style.display='none';
    }
});
</script>