<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../include/layoutTop.jsp" flush="true" />
<!-- Immutable -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/immutable/3.8.1/immutable.min.js"></script>
<!-- React -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/15.4.2/react.min.js"></script>
<!-- React DOM -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/15.4.2/react-dom.min.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.17.0/babel.min.js"></script>
<script type="text/babel" data-presets="es2015,react">

    $(document).ready(function() {


        var data = {
            "현구형마을" : [
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


        class CheckTableContainer extends React.Component {
            componentWillMount() {
                this.state = { data : Immutable.fromJS(this.props.data)};
            }


            changeData() {
                var state = this.state;
                var TopElement = this;
                return function (townName) {
                    return function (index) {
                        return function (isChecked) {
                            const newData = state.data.updateIn([townName, index, "isChecked"], value => isChecked);
                            console.log(newData.toJS());
                            TopElement.setState({data : newData});
                        }
                    }
                };
            }

            render() {

                var checkList = this.state.data.toJS();
                var checkTables = Object.keys(checkList).map((townName) => {
                    return <CheckTable townName={townName}
                                       townCheckList={checkList[townName]}
                                       onChangeData={this.changeData()}/>
                });


                return (
                        <div className="row">
                            {checkTables}
                        </div>
                );
            }
        }


        class CheckTable extends React.Component {

            changeDataSomeTown(index) {
                return this.props.onChangeData(this.props.townName)(index);
            }

            render(){

                var townCheckList = this.props.townCheckList;
                var checkRows = townCheckList.map((townCheck, i) => {
                    return <CheckRow name={townCheck.name}
                                     isChecked={townCheck.isChecked}
                                     onChangeDataSomeTownSomeIsChecked={this.changeDataSomeTown(i)}/>
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

            toggleCheckboxChange = () => {
                this.props.onChangeDataSomeTownSomeIsChecked(!this.props.isChecked);
            };

            render(){
                const { name,isChecked } = this.props;

                return (
                    <tr>
                        <td></td>
                        <td>{name}</td>
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

