<h1>Search Result</h1>
<hr />
<input type="hidden" value="${queryParam}" id="queryParam" />
<input type="hidden" value="${categoryParam}" id="categoryParam" />
<div id="loader" style="text-align:center">
    <img src="static/images/loading-bar.gif">
</div>
<div class="result">
    <p id="nodata">No result found, please try again.</p>
    <table id="table" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Title</th>
                <th>ISBN</th>
                <th>Public Date</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Pages</th>
                <th>Dimension</th>
                <th>Language</th>
                <th>Type</th>
                <th>Category</th>
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
        $.get("search/rest/list?q=" + $("#queryParam").val() + "&c=" + $("#categoryParam").val())
                .success(function (data) {
                    $("div.result").show ();
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
                                {"mDataProp": "title"},
                                {"mDataProp": "isbn"},
                                {"mDataProp": "releaseDate"},
                                {"mDataProp": "price"},
                                {"mDataProp": "quantity"},
                                {"mDataProp": "length"},
                                {"mDataProp": "dimension"},
                                {"mDataProp": "language"},
                                {"mDataProp": "bookType"},
                                {"mDataProp": "bookCategory"}
//                                { "mDataProp": "id",
//                                        "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {							
//                                                $(nTd).html("<a href='book/edit/" + oData.userId + "'>Checkout</a>");
//                                        }
//                                }	
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