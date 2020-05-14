<script>
    $( document ).ready(function() {
        $("#grid-addresses").UIBootgrid(
            {   search:'/api/radsecproxy/tls/searchItem/',
                get:'/api/radsecproxy/tls/getItem/',
                set:'/api/radsecproxy/tls/setItem/',
                add:'/api/radsecproxy/tls/addItem/',
                del:'/api/radsecproxy/tls/delItem/',
                toggle:'/api/radsecproxy/tls/toggleItem/'
            }
        );

        // link apply button to API set action
        $("#saveAct").click(function(){
            // action to run after successful save, for example reconfigure service.
            ajaxCall(url="/api/radsecproxy/service/reconfigure", sendData={},callback=function(data,status) {
                // action to run after reload
            });
        });
    });
</script>

<table id="grid-addresses" class="table table-condensed table-hover table-striped" data-editDialog="DialogTls">
    <thead>
        <tr>
            <th data-column-id="uuid" data-type="string" data-identifier="true"  data-visible="false">{{ lang._('ID') }}</th>
            <th data-column-id="description" data-type="string">{{ lang._('Description') }}</th>
            <th data-column-id="name" data-type="string">{{ lang._('Name') }}</th>
            <th data-column-id="commands" data-width="7em" data-formatter="commands" data-sortable="false">{{ lang._('Commands') }}</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
        <tr>
            <td></td>
            <td>
                <button data-action="add" type="button" class="btn btn-xs btn-default"><span class="fa fa-plus"></span></button>
                <button data-action="deleteSelected" type="button" class="btn btn-xs btn-default"><span class="fa fa-trash-o"></span></button>
            </td>
        </tr>
    </tfoot>
</table>

<div class="col-md-12">
    <button class="btn btn-primary"  id="saveAct" type="button"><b>{{ lang._('Apply') }}</b></button>
</div>

{{ partial("layout_partials/base_dialog",['fields':formDialogTls,'id':'DialogTls','label':lang._('Edit TLS-config')])}}