<!doctype html>
<html lang="ja">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>KINSYUHYO</title>
</head>

<body>
    <div class="container-fluid">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" href="#REGI" data-bs-toggle="tab">REGI</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#CBOX" data-bs-toggle="tab">CASHBOX</a>
            </li>
        </ul>
        % coinkinds = [1,5,10,50,100,500]
        % billkinds = [10000,5000,2000,1000]
        <form action="/printcoincounter" method="post">
            <div class="tab-content">
                <div id="REGI" class="tab-pane active">
                    <h2>regi</h2>
                    <div class="container-fluid">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th style="width:25%"></th>
                                    <th style="width:25%"></th>
                                    <th style="width:10%"></th>
                                    <th style="width:40%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                % for ckinds in coinkinds: ##[1,5,10,50,100,500]:
                                <tr>
                                    <td><label for="r{{ckinds}}">{{ckinds}}円✕</label></td>
                                    <td><input type="number" name="r{{ckinds}}" id="r{{ckinds}}" min="0"></td>
                                    <td>=</td>
                                    <td><label for="r{{ckinds}}" id="rresult{{ckinds}}"></td>
                                </tr>
                                % end
                                <tr>
                                    <td>硬貨計</td>
                                    <td></td>
                                    <td></td>
                                    <td><span id="rcoinsum" /></td>
                                </tr>

                                % for ckinds in billkinds: #[10000,5000,2000,1000]:
                                <tr>
                                    <td><label for="r{{ckinds}}">{{ckinds}}円✕</label></td>
                                    <td><input type="number" name="r{{ckinds}}" id="r{{ckinds}}" min="0"></td>
                                    <td>=</td>
                                    <td><label for="r{{ckinds}}" id="rresult{{ckinds}}"></td>
                                </tr>
                                % end
                                <tr>
                                    <td>紙幣計</td>
                                    <td></td>
                                    <td></td>
                                    <td><span id="rbillsum" /></td>
                                </tr>
                                <tr>
                                    <td>合計</td>
                                    <td></td>
                                    <td></td>
                                    <td><span id="rallsum" /></td>
                                </tr>
                                <tr>
                                    <td>実質売上高</td>
                                    <td><span id="rcalcs">-30000</span></td>
                                    <td colspan="2"><span id="rrealsum" /></span></td>
                                </tr>
                                <tr>
                                    <td>精算売上高</td>
                                    <td colspan="2"><input id="ridealsum" name="ridealsum" /></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>誤差</td>
                                    <td colspan="2"><span id="rmarginerror" /></span></td>
                                    <td></td>
                                </tr>


                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="CBOX" class="tab-pane">
                    <h2>cbox</h2>
                    <div class="container-fluid">
                        <table class="table">
                            <tbody>
                                % for ckinds in coinkinds: #[1,5,10,50,100,500]:
                                <tr>
                                    <td><label for="c{{ckinds}}">{{ckinds}}円✕</label></td>
                                    <td><input type="number" name="c{{ckinds}}" id="c{{ckinds}}" min="0"></td>
                                    <td>=</td>
                                    <td><label for="c{{ckinds}}" id="cresult{{ckinds}}"></td>
                                </tr>
                                % end
                                <tr>
                                    <td>硬貨計</td>
                                    <td></td>
                                    <td></td>
                                    <td><span id="ccoinsum" /></td>
                                </tr>

                                % for ckinds in billkinds: #[10000,5000,2000,1000]:
                                <tr>
                                    <td><label for="c{{ckinds}}">{{ckinds}}円✕</label></td>
                                    <td><input type="number" name="c{{ckinds}}" id="c{{ckinds}}" min="0"></td>
                                    <td>=</td>
                                    <td><label for="c{{ckinds}}" id="cresult{{ckinds}}"></td>
                                </tr>
                                % end
                                <tr>
                                    <td>紙幣計</td>
                                    <td></td>
                                    <td></td>
                                    <td><span id="cbillsum" /></td>
                                </tr>
                                <tr>
                                    <td>合計</td>
                                    <td></td>
                                    <td></td>
                                    <td><span id="callsum"></span></td>
                                </tr>
                                <tr>
                                    <td>実質残高</td>
                                    <td><span id="ccalcs">30000</span> </td>
                                    <td colspan="2"><span id="crealsum"></span></td>
                                </tr>
                                <tr>
                                    <td>理想集計</td>
                                    <td colspan="2"><input id="cidealsum" name="cidealsum" /></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>誤差</td>
                                    <td colspan="2"><span id="cmarginerror" /></span></td>
                                    <td></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <button class="btn btn-primary" id="submitbtn" type="button">印刷</button>
        </form>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
    <script>
        var coinkinds = {{ coinkinds }};
        var billkinds = {{ billkinds }};
    </script>
    <script src="/static/coincounterscript.js?{{timestamp}}"></script>
</body>

</html>