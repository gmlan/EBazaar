<h1>List Of Books</h1>
<hr />
<div id="loader" style="text-align:center">
    <img src="static/images/loading-bar.gif">
</div>
<div class="result">
    <p id="nodata">No result found, please try again.</p>
    <table id="table" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Book Title</th>
                <th>ISBN</th>
                <th>Category</th>
                <th>Language</th>
                <th>Release Date</th>
                <th>Available</th>
                <th>Type</th>
                <th>Price</th>
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
        $.get("book/rest/booklist")
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
                                {"mDataProp": "title"},
                                {"mDataProp": "isbn"},
                                {"mDataProp": "bookCategory"},
                                {"mDataProp": "language"},
                                {"mDataProp": "releaseDate"},
                                {"mDataProp": "quantity"},
                                {"mDataProp": "bookType"},
                                {"mDataProp": "price"},
                                { "mDataProp": "id",
                                        "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {							
                                                $(nTd).html("<a href='book/edit/" + oData.id + "'>Edit</a>");
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