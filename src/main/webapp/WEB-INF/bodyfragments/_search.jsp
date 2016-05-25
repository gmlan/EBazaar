<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form action="search" method="POST" />
<div class="search">
    <input type="text" id="search" name="q" placeholder="input keyword for book title, author and so on">
    
    <div id="btnSearch"  onclick="document.forms[0].submit();">
        <span></span>
    </div>
    
    <div class="loader" style="text-align:center">
        <img src="static/images/ui-anim_basic_16x16.gif">
    </div>
</div>

<div class="row category">
    <c:forEach items="${categories}" var="category"> 
        <div class="categoryitem" style="padding-bottom: 15px" >                        
            <div class="caption">                            	
                <div>       
                    <a class="btn btn-default" href="search/category/${category.key}" >
                        <img src='<c:url value="static/${category.value}"></c:url>'/>
                        </a>
                    </div>
                    <div class="description">${category.key}</div>
            </div>
        </div>
    </c:forEach>
</div>
</form>

<script>  
    $(function () {
        $("div.loader").hide();
        $(document).ajaxStart(function () {$("div.loader").show();  })
                   .ajaxStop(function () {$("div.loader").hide();});

        $("#search").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "search/rest/list",
                    dataType: "json",
                    data: {
                        q: request.term,
                        c: ""
                    },
                    success: function (data) {
                        var result = new Array();
                        for (var i = 0; i < data.length; i++)
                            result[i] = data[i].title;
                        response(result);
                    }
                });
            },
            minLength: 2,
            select: function (event, ui) {
                if (ui.item) {
                    document.forms[0].submit();
                }
            },
            open: function () {
                $(this).removeClass("ui-corner-all").addClass("ui-corner-top");
            },
            close: function () {
                $(this).removeClass("ui-corner-top").addClass("ui-corner-all");
            }
        });
    })
</script>