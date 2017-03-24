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
    var data = {
        "현구마을" : [
            {name : "강현구1", isChecked:false},
            {name : "강현구2", isChecked:false},
            {name : "강현구3", isChecked:false},
            {name : "강현구4", isChecked:false},
        ],
        "형주마을" : [
            {name : "김형주1", isChecked:false},
            {name : "김형주2", isChecked:false},
            {name : "김형주3", isChecked:false},
            {name : "김형주4", isChecked:false},
        ]
    };


    class CheckTable extends React.Component {
        getCountChecked = () => {
            var townCheckList = this.props.townCheckList;
            alert(townCheckList.filter((townCheck) => townCheck.isChecked).length);
        };

        render(){

            var townCheckList = this.props.townCheckList;
            var checkRows = townCheckList.map((townCheck) => {
                return <CheckRow name={townCheck.name} isChecked={townCheck.isChecked} getCountCheck={this.getCountChecked}/>
            });

            return (
                <div className="col-md-3">
                    <h3 class="panel-title">{this.props.townName}</h3>

                    <table className="table table-hover">
                        <thead>
                        <tr className="active">
                            <td>#</td>
                            <td>이름</td>
                            <td>출석</td>
                        </tr>
                        </thead>
                        <tbody id="machine-box">
                            {checkRows}
                        </tbody>
                    </table>

                </div>
            );
        }
    }

    class CheckRow extends React.Component {
        state = {
            isChecked: false,
        };

        toggleCheckboxChange = () => {
            this.setState(({ isChecked }) => (
                {
                    isChecked: !isChecked,
                }
            ));
            this.props.getCountCheck();
        };

        render(){
            const { isChecked } = this.state;

            return (
				<tr>
					<td></td>
					<td>{this.props.name}</td>
					<td>
                        <div class="input-group">
                            <label>
                                <input type="checkbox"
                                       checked={isChecked}
                                       onChange={this.toggleCheckboxChange}
                                />
                            </label>
                        </div>
                    </td>
				</tr>
            );
        }
    }

    class CheckTableContainer extends React.Component {
        render() {

            var checkList = this.props.data;
            var checkTables = Object.keys(checkList).map((townName) => {
                console.log(townName);
                return <CheckTable townName={townName} townCheckList={checkList[townName]}/>
            });


            return (
                <div className="row">
                    {checkTables}
                </div>
            );
        }
    }

    let target =  document.getElementById("main-container");
    // temporary render target
    var temp = document.createElement("div");
    // render
    ReactDOM.render(
        (
                <CheckTableContainer data={data}/>
        ), temp
    );
    // grab the container
    var container = document.getElementById("main-container");
    // and replace the child
    container.replaceChild(temp.querySelector(".row"), document.getElementById("table-row"));
});
</script>

<title>세광청년부 - 청년부 교적부</title>
</head>

<body>


<div class="container" id="main-container">
    <div id="table-row"></div>
</div>

<jsp:include page="../include/layoutBottom.jsp" flush="true" />

