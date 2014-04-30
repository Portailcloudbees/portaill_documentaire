var facture = function () {

    return {

        //main function to initiate the module
        init: function () {
            function restoreRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);

                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    oTable.fnUpdate(aData[i], nRow, i, false);
                }

                oTable.fnDraw();
            }
            
            function addRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                jqTds[0].innerHTML = '<input type="date" class="form-control input-large" value="' + aData[0] + '">';
                jqTds[1].innerHTML = '<input type="date" class="form-control input-large" value="' + aData[1] + '">';
                jqTds[2].innerHTML = '<input type="date" class="form-control input-large" value="' + aData[2] + '">';
                jqTds[3].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[3] + '">';
                jqTds[4].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[4] + '">';
               
                jqTds[5].innerHTML = '<a class="edit" href="">Save</a>';
               
               
            }
            

           

            function saveRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                oTable.fnUpdate(jqInputs[4].value, nRow, 4, false);
              
              
                var table = [];
                table.push( { "date" : jqInputs[0].value ,
                		    "from": jqInputs[1].value ,
                		    "to":jqInputs[2].value ,
                		    "soc":jqInputs[3].value,
                		    "email":jqInputs[4].value}
                );
               
                $.ajax({
                	type:"POST",
                	url: "./factureServlet",
                	contentType: "application/x-www-form-urlencoded",
                	dataType: "JSON",
                	data: {ligne:JSON.stringify(table)},//table,
                	success: function(data) {
                		alert("Success");
                		}
                		})
                 
               
                oTable.fnUpdate('<a class="" href="">view</a>', nRow, 7, false);
                oTable.fnDraw();
               
            }

            function cancelEditRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                oTable.fnUpdate(jqInputs[4].value, nRow, 4, false);
                oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 5, false);
                oTable.fnDraw();
            }

            var oTable = $('#sample_editable_facture').dataTable({
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                // set the initial value
                "iDisplayLength": 5,
                
                "sPaginationType": "bootstrap",
                "oLanguage": {
                    "sLengthMenu": "_MENU_ records",
                    "oPaginate": {
                        "sPrevious": "Prev",
                        "sNext": "Next"
                    }
                },
                "aoColumnDefs": [{
                        'bSortable': false,
                        'aTargets': [0]
                    }
                ]
            });

            jQuery('#sample_editable_1_wrapper .dataTables_filter input').addClass("form-control input-medium"); // modify table search input
            jQuery('#sample_editable_1_wrapper .dataTables_length select').addClass("form-control input-small"); // modify table per page dropdown
            jQuery('#sample_editable_1_wrapper .dataTables_length select').select2({
                showSearchInput : false //hide search box with special css class
            }); // initialize select2 dropdown

            var nEditing = null;

            $('#sample_editable_facture_new').click(function (e) {
                e.preventDefault();
                var aiNew = oTable.fnAddData(['', '', '', '', '', 
                        '<a class="" href="">view</a>'
                ]);
                var nRow = oTable.fnGetNodes(aiNew[0]);
                addRow(oTable, nRow);
                nEditing = nRow;
            });

            $('#sample_editable_facture a.delete').live('click', function (e) {
                e.preventDefault();

                if (confirm("Are you sure to delete this row ?") == false) {
                    return;
                }

                var nRow = $(this).parents('tr')[0];
                var d =oTable.fnGetData(nRow);
                oTable.fnDeleteRow(nRow);
               
               
                $.ajax({
                	type:"POST",
                	url: "./delete",
                	contentType: "application/x-www-form-urlencoded",
                	dataType: "JSON",
                	data: {mail:d[0]},
                	success: function(data) {
                		//alert("Success");
                		}
                	})
                alert("Deleted! ");
               
            });

            $('#sample_editable_facture a.cancel').live('click', function (e) {
                e.preventDefault();
                if ($(this).attr("data-mode") == "new") {
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                } else {
                    restoreRow(oTable, nEditing);
                    nEditing = null;
                }
            });

            $('#sample_editable_facture a.edit').live('click', function (e) {
                e.preventDefault();

                /* Get the row as a parent of the link that was clicked on */
                var nRow = $(this).parents('tr')[0];

                if (nEditing !== null && nEditing != nRow) {
                    /* Currently editing - but not this row - restore the old before continuing to edit mode */
                    restoreRow(oTable, nEditing);
                    editRow(oTable, nRow);
                    nEditing = nRow;
                } else if (nEditing == nRow && this.innerHTML == "Save") {
                    /* Editing this row and want to save it */
                    saveRow(oTable, nEditing);
                    alert("Saving Data...");
                    nEditing = null;
                    
                }
            });
            
        }

    };

}();