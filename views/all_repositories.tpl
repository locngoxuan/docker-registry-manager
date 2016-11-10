{{template "base/base.html" .}}
{{define "body"}}
  <div class="right-content-container">
    <div class="header">
      <ol class="breadcrumb">
        <li><a href="/">Home</a></li>
        <li><a href="/registries">Registries</a></li>
        <li class="active">Repositories</li>
      </ol>
    </div>
    <div class="content-block white-bg">
      <div class="row">
        <h1>All Repositories</h1>
        <hr>
      </div>
      <div class="row">
        <table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
          <thead>
            <th>Repository:</th>
            <th>Registry:</th>
            <th>Tags:</th>
          </thead>
          <tfoot>
            <th>Repository:</th>
            <th>Registry:</th>
            <th>Tags:</th>
          </tfoot>
          <tbody>
            {{range $registryName, $repositories := .repositories}}
              {{range $key, $repo := $repositories}}
              <tr>
                <td><a href=/registries/{{$registryName}}/repositories/{{urlquery $repo.Name}}/tags>{{$repo.Name}}</span></td>
                <td>{{$registryName}}</td>
                <td>{{len $repo.Tags}}</td>
              </tr>
              {{end}}
            {{end}}
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <script>
  $(document).ready(function() {
      $('#datatable').DataTable( {
          "order": [[ 1, "asc" ]],
          "pageLength": 25
      } );
      $(function () {
        $('[data-toggle="tooltip"]').tooltip({container: 'body'})
      })
  });
  </script>
{{end}}