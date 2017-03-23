<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../include/layoutTop.jsp" flush="true" />
<!-- React -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/15.4.2/react.min.js"></script>
<!-- React DOM -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/15.4.2/react-dom.min.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.17.0/babel.min.js"></script>
<script type="text/babel" data-presets="es2015,react">
$(document).ready(function() {
    class CheckTable extends React.Component {


        render(){
            return (
                <CheckRow name="강현구" isChecked="true"/>
            );
        }
    }

    class CheckRow extends React.Component {
        render(){
            return (
                    <tr>
                        <td></td>
                        <td>{this.props.name}</td>
                        <td><input type="checkbox" checked={this.props.isChecked}/></td>
                    </tr>
            );
        }
    }

    let target =  document.getElementById('machine-box');

    ReactDOM.render(
            <CheckTable />, target
    );
});
</script>

<title>세광청년부 - 청년부 교적부</title>
</head>

<body>


<div class="container">

	<div class="row">
        <!-- 검색 부 -->
        <form class="form-inline" method="post" action ="/segwangYouth/members">
			<div class="form-group">
				이름: <input type="text" class="form-control" name="name"/>
				마을:
				<select class="form-control" name="village">
					<option value="">전체</option>
				</select>
				직책:
				<select class="form-control" name="memberPosition">
					<option value="">전체</option>
					<c:forEach var="codeList" items="${selectList.codeListAA}">
					<option value="${codeList.CODE_NO}">${codeList.CODE_NAME}</option>
					</c:forEach>
				</select>
				<button type="submit" class="btn btn-default">조회</button>  <br><br> 		
			</div>
        </form>
        <!-- 검색 부 -->


			<div class="table-search">
				<h3 class="panel-title">출석부</h3>
				<table class="table table-hover">
					<thead>
					<tr class="active">
						<td>#</td>
						<td>이름</td>
						<td>출석</td>
					</tr>
					</thead>
					<tbody id="machine-box">

					</tbody>
				</table>
			</div><!--  class="table-search" -->

	</div> <!-- row -->

</div>

<jsp:include page="../include/layoutBottom.jsp" flush="true" />

