<h1>List User</h1>
<hr />
<div id="loader" style="text-align:center">
    <img src="static/images/loading-bar.gif">
</div>
<div class="result">
    <p id="nodata">No result found, please try again.</p>
    <table id="table" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>User Name</th>
                <th>Type</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Enabled</th>
                <th>Phone</th>
                <th>Address</th>
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
        $.get("admin/rest/list")
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
                            "pageLength": 10,
                            "aoColumns": [
                                {"mDataProp": "userName"},
                                {"mDataProp": "type"},
                                {"mDataProp": "firstName"},
                                {"mDataProp": "lastName"},
                                {"mDataProp": "email"},
                                {"mDataProp": "enabled"},
                                {"mDataProp": "phone"},
                                {"mDataProp": "address"},
                                { "mDataProp": "userId",
                                        "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {							
                                                $(nTd).html("<a href='admin/edit/" + oData.userId + "'>Edit</a>");
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