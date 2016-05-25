
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<section>
    <div class=" jumbotron">
        <div class="container">
            <p class="text-center" >
            <h2>Add Member</h2>
            </p>
        </div>
    </div>
</section>



<form:form class="form-horizontal" modelAttribute="newMember" >
    <form:errors path="*" cssClass="alert alert-danger" element="div"/>
    <div class="form-group">
        <label for="memberId" class="col-sm-2 control-label">Member Id</label>
        <div class="col-sm-6">
            <form:input type="text" path="memberId" class="form-control" id="memberId" placeholder="member Id" />
             <form:errors path="memberId" cssStyle="color:red" />
        </div>
    </div>

    <div class="form-group">
        <label for="firstName" class="col-sm-2 control-label">First Name</label>
        <div class="col-sm-6">
            <form:input type="text" path="firstName" class="form-control" id="firstName" placeholder="first name" />
            <form:errors path="firstName" cssStyle="color:red" />
        </div>
    </div>

    <div class="form-group">
        <label for="lastName" class="col-sm-2 control-label">Last Name</label>
        <div class="col-sm-6">
            <form:input type="text" path="lastName" class="form-control" id="lastName" placeholder="last name" />
            <form:errors path="lastName" cssStyle="color:red" />
        </div>
    </div>

    <div class="form-group">
        <label for="email" class="col-sm-2 control-label">Email</label>
        <div class="col-sm-6">
            <form:input type="text" path="email" class="form-control" id="email" placeholder="eg. user@mydomain.com" />
            <form:errors path="email" cssStyle="color:red" />
        </div>
    </div>

    <div class="form-group">
        <label for="phone" class="col-sm-2 control-label">Phone</label>
        <div class="col-sm-6">
            <form:input type="text" path="phone" class="form-control" id="phone" placeholder="phone" />
            <form:errors path="phone" cssStyle="color:red" />
        </div>
    </div>

    <div class="col-sm-10">
        <fieldset>
            <legend>Address</legend>
            <div class="form-group">
                <label for="street" class="col-sm-2 control-label">Street</label>
                <div class="col-sm-6">
                    <form:input type="text" path="street" class="form-control" id="street" placeholder="eg. 1000 N 4th St." />
                </div>
            </div>

            <div class="form-group">
                <label for="zip" class="col-sm-2 control-label">Zip</label>
                <div class="col-sm-6">
                    <form:input type="text" path="zip" class="form-control" id="zip" placeholder="zip" />
                    <form:errors path="zip" cssStyle="color:red" />
                </div>
            </div>

            <div class="form-group">
                <label for="city" class="col-sm-2 control-label">City</label>
                <div class="col-sm-6">
                    <form:input type="text" path="city" class="form-control" id="city" placeholder="city" />
                </div>
            </div>

            <div class="form-group">
                <label for="state" class="col-sm-2 control-label">State</label>
                <div class="col-sm-6">
                    <form:select path="state" class="form-control mrgn-bttm-md" id="state">
                        <form:option value="">--SELECT ONE--</form:option>
                        <form:option value="IA">IA</form:option>
                        <form:option value="CA">CA</form:option>
                        <form:option value="FL">FL</form:option>
                        <form:option value="DC">DC</form:option>
                        <form:option value="NY">NY</form:option>
                    </form:select>
                </div>
            </div>

            <div class="form-group">
                <label for="country" class="col-sm-2 control-label">Country</label>
                <div class="col-sm-6">
                    <form:select path="country" class="form-control mrgn-bttm-md" id="country">
                        <form:option value="">--SELECT ONE--</form:option>
                        <form:option value="United States">United States</form:option>
                        <form:option value="Chine">Chine</form:option>
                        <form:option value="Ethiopea">Ethiopea</form:option>
                        <form:option value="Bahamus">Bahamus</form:option>
                        <form:option value="Nepal">Nepal</form:option>
                    </form:select>
                </div>
            </div>

        </fieldset>
    </div>

    <p>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <input type="submit" class="btn btn-primary" value="Save" />
        </div>
    </div>
</p>
</form:form>