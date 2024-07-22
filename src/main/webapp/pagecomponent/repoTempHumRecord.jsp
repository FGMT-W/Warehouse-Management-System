<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script>
    // 查询参数
    search_repo_id = null;

    $(function(){
        repoTempHumTableInit();
        searchActionInit();
        exportRecordAction();
    })

    // 表格初始化
    function repoTempHumTableInit(){
        $('#repoTempHumTable').bootstrapTable({
            columns:[{
                field : 'logID',
                title : '记录ID'
            },{
                field : 'repoID',
                title : '仓库ID'
            },{
                field : 'temp',
                title : '温度'
            },{
                field : 'hum',
                title : '湿度'
            },{
                field : 'repoAdminName',
                title : '管理员名称'
            },{
                field : 'createTime',
                title : '时间',
                formatter: function (value, row, index) {
                    var date = new Date(value + 8 * 3600 * 1000); // 增加8小时
                    return date.toJSON().substr(0, 19).replace('T', ' ');
                }
            },{
                field : 'remark',
                title : '备注'
            }],
            url : 'repoTempHum/getRepoTempHumList',
            method : 'GET',
            queryParams : queryParams,
            sidePagination : "server",
            dataType : 'json',
            pagination : true,
            pageNumber : 1,
            pageSize : 5,
            pageList : [ 5, 10, 25, 50, 100 ],
            clickToSelect : true
        });
    }

    // 表格刷新
    function tableRefresh() {
        $('#repoTempHumTable').bootstrapTable('refresh', {
            query : {}
        });
    }

    // 分页查询参数
    function queryParams(params) {
        var temp = {
            limit : params.limit,
            offset : params.offset,
            operID : search_repo_id
        }
        return temp;
    }

    // 查询操作
    function searchActionInit(){
        $('#search_button').click(function(){
            search_repo_id = $('#repo_id').val();
            tableRefresh();
        })
    }

    function exportRecordAction() {
        $('#export_record').click(function() {
            $('#export_modal').modal("show");
        });

        $('#export_record_download').click(
            function() {
                var data = {
                    operID : search_repo_id
                }
                var url = "repoTempHum/exportRecord?"
                    + $.param(data);
                window.open(url, '_blank');
                $('#export_modal').modal("hide");
            });
    }
</script>

<div class="panel panel-default">
    <ol class="breadcrumb">
        <li>查看仓库温湿度</li>
    </ol>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-2">
                <form action="" class="form-inline">
                    <div class="form-group">
                        <label class="form-label">仓库ID：</label>
                        <input type="text" id="repo_id" class="form-control" placeholder="指定仓库ID" style="width:50%">
                    </div>
                </form>
            </div>
            <div class="col-md-4">
                <button class="btn btn-success" id="search_button">
                    <span class="glyphicon glyphicon-search"></span> <span>查询</span>
                </button>
            </div>
        </div>
        <div class="row" style="margin-top: 25px">
            <div class="col-md-5">
                <button class="btn btn-sm btn-default" id="export_record">
                    <span class="glyphicon glyphicon-export"></span> <span>导出</span>
                </button>
            </div>
            <div class="col-md-5"></div>
        </div>
        <div class="row" style="margin-top:25px">
            <div class="col-md-12">
                <table class="table table-striped" id="repoTempHumTable"></table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="export_modal" table-index="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">导出仓库环境信息</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-3 col-sm-3" style="text-align: center;">
                        <img src="media/icons/warning-icon.png" alt=""
                             style="width: 70px; height: 70px; margin-top: 20px;">
                    </div>
                    <div class="col-md-8 col-sm-8">
                        <h3>是否确认导出仓库环境信息</h3>
                        <p>(注意：请确定要导出的仓库环境信息，导出的内容为当前列表的搜索结果)</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>取消</span>
                </button>
                <button class="btn btn-success" type="button"
                        id="export_record_download">
                    <span>确认下载</span>
                </button>
            </div>
        </div>
    </div>
</div>