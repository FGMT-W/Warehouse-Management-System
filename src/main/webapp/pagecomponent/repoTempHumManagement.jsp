<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script>
    $(function() {
        bootstrapValidatorInit();
        datePickerInit();
        subitInit();

        $('.form_date').datetimepicker('setDate', new Date());
    })

    function bootstrapValidatorInit() {
        $("#repoTempHumAddRecord_form").bootstrapValidator({
            message : 'This is not valid',
            feedbackIcons : {
                valid : 'glyphicon glyphicon-ok',
                invalid : 'glyphicon glyphicon-remove',
                validating : 'glyphicon glyphicon-refresh'
            },
            excluded : [ ':disabled' ],
            fields : {
                temp : {
                    validators : {
                        notEmpty : {
                            message : '温度不能为空'
                        }
                    }
                },
                hum : {
                    validators : {
                        notEmpty : {
                            message : '湿度不能为空'
                        }
                    }
                },
                createTime : {
                    validators : {
                        notEmpty : {
                            message : '时间不能为空'
                        }
                    }
                }
            }
        });
    }

    // 日期选择器初始化
    function datePickerInit(){
        $('.form_date').datetimepicker({
            format:'yyyy-mm-dd hh:ii:ss ',
            language : 'zh-CN',
            endDate : new Date(),
            weekStart : 1,
            todayBtn : 1,
            autoClose : 1,
            todayHighlight : 1,
            startView : 2,
            forceParse : 0,
            minView:0
        });
    }

    function subitInit(){
        $('#add_record_submit').click(function() {
            addRepoTempHumRecord();
         });
    }

    function addRepoTempHumRecord() {
        var data = {
            temp : parseFloat($('#temp').val()),
            hum : parseFloat($('#hum').val()),
            remark : $('#remark').val(),
            createTimeStr : $('#createTime').val()
        }

        $.ajax({
            type : "POST",
            url : "repoTempHum/addRepoTempHumRecord",
            dataType : "json",
            contentType : "application/json",
            data : JSON.stringify(data),
            success : function(response) {
                var msg;
                var type;
                if (response.result == "success") {
                    type = "success";
                    msg = "仓库温湿度提交成功</p>";
                } else if (response.result == "error") {
                    type = "error";
                    msg = "仓库温湿度提交失败";
                }
                infoModal(type, msg);
                // reset
                $('#temp').val("");
                $('#hum').val("");
                $('#remark').val("");
                $('#createTime').val("");
                $('#repoTempHumAddRecord_form').bootstrapValidator("resetForm", true);
            },
            error : function(response) {
            }
        })
    }

    // 操作结果提示模态框
    function infoModal(type, msg) {
        $('#info_success').removeClass("hide");
        $('#info_error').removeClass("hide");
        if (type == "success") {
            $('#info_error').addClass("hide");
        } else if (type == "error") {
            $('#info_success').addClass("hide");
        }
        $('#info_content').html(msg);
        $('#info_modal').modal("show");
    }
</script>

<div class="panel panel-default">
    <ol class="breadcrumb">
        <li>仓库温湿度管理</li>
    </ol>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-1 col-sm-2"></div>
            <div class="col-md-8 col-sm-8">
                <form class="form-horizontal" role="form" id="repoTempHumAddRecord_form" style="margin-top: 25px">
                    <div class="form-group">
                        <label for="" class="control-label col-md-1 col-sm-1"> <span>温度:</span>
                        </label>
                        <div class="col-md-3 col-sm-3">
                            <input type="text" class="form-control" id="temp"
                                   name="temp" placeholder="仓库温度">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-md-1 col-sm-1"> <span>湿度:</span>
                        </label>
                        <div class="col-md-3 col-sm-3">
                            <input type="text" class="form-control" id="hum"
                                   name="hum" placeholder="仓库湿度">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="createTime" class="control-label col-md-1 col-sm-1">
                            <span>时间:</span>
                        </label>
                        <div class="col-md-3 col-sm-3">
                            <input class="form_date form-control" value="" id="createTime" name="createTime" placeholder="时间">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-md-1 col-sm-1"> <span>备注:</span>
                        </label>
                        <div class="col-md-3 col-sm-3">
                            <input type="text" class="form-control" id="remark"
                                   name="remark" placeholder="备注">
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-1 col-sm-1"></div>
        </div>
        <div class="row" style="margin-top:25px">
            <button class="btn btn-success" type="button" id="add_record_submit" style="margin-left: 20%">
                <span>提交</span>
            </button>
        </div>
    </div>
</div>

<div class="modal fade" id="info_modal" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">信息</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-4 col-sm-4"></div>
                    <div class="col-md-4 col-sm-4">
                        <div id="info_success" class=" hide" style="text-align: center;">
                            <img src="media/icons/success-icon.png" alt=""
                                 style="width: 100px; height: 100px;">
                        </div>
                        <div id="info_error" style="text-align: center;">
                            <img src="media/icons/error-icon.png" alt=""
                                 style="width: 100px; height: 100px;">
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4"></div>
                </div>
                <div class="row" style="margin-top: 10px">
                    <div class="col-md-4 col-sm-4"></div>
                    <div class="col-md-4 col-sm-4" style="text-align: center;">
                        <h4 id="info_content"></h4>
                    </div>
                    <div class="col-md-4 col-sm-4"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>&nbsp;&nbsp;&nbsp;关闭&nbsp;&nbsp;&nbsp;</span>
                </button>
            </div>
        </div>
    </div>
</div>