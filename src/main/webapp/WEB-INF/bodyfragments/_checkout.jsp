
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<section>
    <div class=" jumbotron">
        <div class="container">
            <p class="text-center" >
            <h2>Add Checkout</h2>
            </p>
        </div>
    </div>
</section>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>

<script>
    $(document).ready(function () {
        $('#dateRangePicker')
                .datepicker({
                    format: 'mm/dd/yyyy',
                    startDate: '01/01/1990',
                    endDate: '01/01/2018'
                })
                .on('changeDate', function (e) {
                    // Revalidate the date field
                    $('#dateRangeForm').formValidation('revalidateField', 'date');
                });

        $('#dateRangePicker2')
                .datepicker({
                    format: 'mm/dd/yyyy',
                    startDate: '01/01/1990',
                    endDate: '01/01/2018'
                })
                .on('changeDate', function (e) {
                    // Revalidate the date field
                    $('#dateRangeForm').formValidation('revalidateField', 'date');
                });

        $('#dateRangeForm').formValidation({
            framework: 'bootstrap',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                date: {
                    validators: {
                        notEmpty: {
                            message: 'The date is required'
                        },
                        date: {
                            format: 'mm/dd/yyyy',
                            min: '01/01/1990',
                            max: '01/01/2018',
                            message: 'The date is not a valid'
                        }
                    }
                }
            }
        });
    });

</script>

<form:form class="form-horizontal" modelAttribute="newCheckOut" >
    <form:errors path="*" cssClass="alert alert-danger" element="div"/>
    <div class="form-group">
        <label for="isbn" class="col-sm-2 control-label">ISBN</label>
        <div class="col-sm-4">
            <form:select path="ISBN" class="form-control mrgn-bttm-md" id="isbn">
                <form:option value="">--SELECT ONE--</form:option>
                <c:forEach items="${bookList}" var="book">
                    <form:option value="${book.isbn}">${book.isbn}</form:option>
                </c:forEach>
            </form:select>
            <form:errors path="ISBN" cssStyle="color:red" />
        </div>
    </div>
    <div class="form-group">
        <label for="memberId" class="col-sm-2 control-label">Member Id</label>
        <div class="col-sm-4">

            <form:select path="memberId" class="form-control mrgn-bttm-md" id="memberId">
                <form:option value="">--SELECT ONE--</form:option>
                <c:forEach items="${memberList}" var="member">
                    <form:option value="${member.memberId}">${member.memberId}</form:option>
                </c:forEach>
            </form:select>
            <form:errors path="memberId" cssStyle="color:red" />
        </div>
    </div>
    <div class="form-group">
        <label for="dateRangePicker" class="col-sm-2 control-label">CheckOut Date</label>
        <div class="col-sm-4 input-group input-append date" id="dateRangePicker">
            <form:input path="dateCheckout" class="form-control" name="date" placeholder="mm/dd/yyyy"/>
            <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>
        <form:errors path="dateCheckout" cssStyle="color:red" />

    </div>
    <div class="form-group">
        <label for="dateRangePicker2" class="col-sm-2 control-label">Due Date</label>
        <div class="col-sm-4 input-group input-append date" id="dateRangePicker2">
            <form:input path="dueDate" class="form-control" name="date" placeholder="mm/dd/yyyy"/>
            <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
        </div>
        <form:errors path="dueDate" cssStyle="color:red" />

    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <input type="submit" class="btn btn-primary" value="Save" />
        </div>
    </div>
</form:form>
