<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>List Checkouts</h1>
<div class="bg-success">
    <h2 class="text-success">${message}</h2>
</div>
<hr />
<div class="result">
    <table id="table" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>ISBN</th>
                <th>Member ID</th>
                <th>Check out date</th>
                <th>Due date</th>
                <th>Action</th>
            </tr>
        </thead>
        <c:forEach items="${checkoutList}" var="checkout" >
            <tr>
                <td>${checkout.ISBN}</td>
                <td>${checkout.memberId}</td>
                <td>${checkout.dateCheckout}</td>
                <td>${checkout.dueDate}</td>
                <td>
                    <a href='<c:url value="checkout/edit/${checkout.id}"/>' class="btn btn-primary">
                            Edit
                    </a> 
                    <a href='<c:url value="checkout/delete/${checkout.id}" />' class="btn btn-success">
                            Check in
                    </a><br>
                </td>
            </tr>
            </tr>
        </c:forEach>
    </table>
</div>

<script>
    $(document).ready(function () {
        $('#table').DataTable();
    });
</script>