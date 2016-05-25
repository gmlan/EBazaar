<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>Members List</h1>
<div class="bg-success">
    <h2 class="text-success">${message}</h2>
</div>
<hr />
<div class="result">
    <table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Member ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Street</th>
                <th>Zip</th>
                <th>City</th>
                <th>State</th>
                <th>Country</th>
                <th>Action</th>
            </tr>
        </thead>
        <c:forEach items="${memberList}" var="member" >
            <tr>
                <td>${member.memberId}</td>
                <td>${member.firstName}</td>
                <td>${member.lastName}</td>
                <td>${member.email}</td>
                <td>${member.phone}</td>
                <td>${member.street}</td>
                <td>${member.zip}</td>
                <td>${member.city}</td>
                <td>${member.state}</td>
                <td>${member.country}</td>
                <td>
                    <a href='<c:url value="member/edit/${member.memberId}"/>' class="btn btn-primary">
                        Edit
                    </a>
                    <a href='<c:url value="member/delete/${member.memberId}" />' class="btn btn-danger">
                        Delete
                    </a><br>
                    </td>
                </tr>
        </c:forEach>
    </table>
</div>

<script>
    $(document).ready(function () {
        $('#table').DataTable();
    });
</script>