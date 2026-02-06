<%-- 
    Document   : NepDate
    Created on : Sep 18, 2025, 10:57:15 AM
    Author     : plazma
--%>

                <select name="vDOBBS_month" id="vDOBBS_month" style="width:30%; background-color: #BAD6B6;">
                  <option value="" selected disabled> Month</option>
                  <option value="Baisakh">Baisakh</option>
                  <option value="Jestha">Jestha</option>
                  <option value="Ashad">Ashad</option>
                  <option value="Shrawan">Shrawan</option>
                  <option value="Bhadra">Bhadra</option>
                  <option value="Asoj">Asoj</option>
                  <option value="Kartik">Kartik</option>
                  <option value="Mangsir">Mangsir</option>
                  <option value="Poush">Poush</option>
                  <option value="Magh">Magh</option>
                  <option value="Falgun">Falgun</option>
                  <option value="Chaitra">Chaitra</option>
                </select>
         
                <select name="vDOBBS_day" id="vDOBBS_day" style="width:20%; background-color: #BAD6B6;">
                  <option value="" selected disabled>Day</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                  <option value="25">25</option>
                  <option value="26">26</option>
                  <option value="27">27</option>
                  <option value="28">28</option>
                  <option value="29">29</option>
                  <option value="30">30</option>
                  <option value="31">31</option>
                  <option value="32">32</option>
                </select>

                <input placeholder="Type year in B.S." name="vDOBBS_year" type="text" id="vDOBBS_year" style="width:35%; background-color: #BAD6B6;">
                <br>
                <button type="button" onclick="formatDOB()" width="50%">OK</button>
                
<script>
  function formatDOB() {
    var month = document.getElementById("vDOBBS_month").value;
    var day = document.getElementById("vDOBBS_day").value;
    var year = document.getElementById("vDOBBS_year").value;
    

    var formattedDOB = day + "-" + month + "-" + year;
    var dateElem = document.getElementById("vDATE");
    var dateOneElem = document.getElementById("vDUEDATE");

    if (dateElem) {
      dateElem.value = formattedDOB;
    } else if (dateOneElem) {
      dateOneElem.value = formattedDOB;
    }

  }
</script>