<h1>List Of Authors</h1>
<hr />
<div id="loader" style="text-align:center">
    <img src="static/images/loading-bar.gif">
</div>
<div class="result">
    <p id="nodata">No result found, please try again.</p>
    <table id="table" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
               
                <th></th>
            </tr>
        </thead>
    </table>
</div>

<script>
    var table;
    $(function () {        
        $(document).ajaxStart(function(){ $("#loader").show(); })
                    .ajaxStop(function() { $("#loader").hide(); });
        $("div.result").hide ();
        $.get("author/rest/authorlist")
                .success(function (data) {
                    $("div.result").show();
                    if (data.length == 0) {
                        $("#table").hide();
                        $("#nodata").show();
                    } else {
                        $("#table").show();
                        $("#nodata").hide();

                        if (table)
                            table.destroy();

                        table = $('#table').DataTable({
                            "aaData": data,
                            "pageLength": 5,
                            "aoColumns": [

                                {"mDataProp": "firstName"},
                                {"mDataProp": "lastName"},
                                {"mDataProp": "phone"},
                                {"mDataProp": "email"},
                                { "mDataProp": "id",
                                        "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {							
                                                $(nTd).html("<a href='author/edit/" + oData.id + "'>Edit</a>");
                                        }
                                }	
                            ]
                        });
                    }
                })
                .fail(function (data) {
                    console.log(data);
                });
    });
</script>
</form>