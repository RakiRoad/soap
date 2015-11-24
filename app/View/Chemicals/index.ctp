<!doctype html>
    <html>
    <head>
        <?php $this->Html->script('jquery'); ?>
        <script type="text/javascript" src="<?php echo $this->webroot; ?>/js/userQuery.js"></script>
    </head>
    <body>
        <div class="span2">
            <?php echo $this->element('sidebar'); ?>
        </div>

	 <!-- Search options, available after Options in the search bar is selected -->
        <div class="span10" style="margin-left:20%;">
            <div style="text-align:center;"><input style="width:70%; padding-left:18px; background: white no-repeat scroll left center url('<?php echo $this->webroot; ?>img/icon_search.png');" id="mainSearchBar" type="text" placeholder="Search by chemical name or click 'options' for more advanced searching."><a title="Options" id="select_cog" href="#"><img style="position:relative; z-index:100; margin-left:-60px; margin-top:-7px;" src="<?php echo $this->webroot; ?>img/icon_cog.png"></a></div>
            <div id="options" style="display:none; color:white; margin-bottom:20px;">
                <label class="filterLabel">Filters:</label><br>
                <label class="filterLabel">Chemical Name</label><input class="filter" type="input"><br>
                <label class="filterLabel">Carcinogenic</label><input class="filter" type="input"><br>
                <label class="filterLabel">Clean Air Act</label><input class="filter" type="input"><br>
                <label class="filterLabel">Metal</label><input class="filter" type="input"><br>
                <label class="filterLabel">PBT</label><input class="filter" type="input"><br>
	    </div>
           
	    <!--Table formatting. Zebra striped table, with 5 categories of information-->
	    <!--Andrew Preuss, shorten the names of chemicals when being viewed on a small screen(mobile device)-->
            <table class="table table-striped" style="border-top: 0px;">
                <thead>
                    <tr>
			<!-- Tooltip hover information for the Table headers - Joie Murphy-->
                        <th class="span3"style="width:auto"><a href="#" rel="tooltip" id="chemical_name" class="orderButton" style="color: #F5F3DC" title="Chemicals commonly associated with hazardous waste.">Chemical Name</a></th>
                        <th class="span3" style="width:auto;"><a href="#" rel="tooltip" id="carcinogenic" class="orderButton" style="color: #F5F3DC" title="Any type of substance, pollutant, or contaminant having the potential to cause cancer.">Carcinogenic</a></th>
                        <th class="span3" style="width:auto;"><a href="#" rel="tooltip" id="clean_air_act" class="orderButton" style="color: #F5F3DC" title="The Clean Air Act (CAA) is the federal law that regulates air emissions from stationary and mobile sources.">Clean Air Act</a></th>
                        <th class="span3" style="width:auto;"><a href="#" rel="tooltip" id="metal" class="orderButton" style="color: #F5F3DC" title="A solid material that is typically hard, shiny, malleable, fusible, and ductile, with good electrical and thermal conductivity. Some metals are aluminum, copper, silver, lead, etc.">Metal</a></th>

                        <th class="span3" style="width:auto;"><a href="#" rel="tooltip" id="pbt" class="orderButton" style="color: #F5F3DC" title="PBT pollutants are chemicals that are toxic and pose risks to human health and ecosystems.">PBT</a></th>
                </tr>

                    </tr>
                </thead>
                <input id="currentOffset" type="hidden">
                <input id="currentCount" type="hidden">
		<input id="currentOrder" type="hidden">
                <input id="currentLimit" type="hidden" value=25>
                <tbody id="dataTable"> 
                </tbody>
            </table>

	    <!--Number pagination, skip to a different page or alter how many items on each page-->
            <div class="row-fluid">
                <div class="span2" style="margin-top:12px; text-align:center;">
                    Page <span id="currentPage">1</span> of <span id="pageCount"></span><br><span id="totalResults"></span>	
                </div>
                <div id="pageList" class="span7 pagination pagination-centered">
                </div>
                <div class="span3" style="margin-top:12px; text-align:center;">
                    Items per Page:
                    <a href="#" class="limit" style="text-decoration:underline">25</a>
                    <a href="#" class="limit">50</a>
                    <a href="#" class="limit">75</a>
                    <a href="#" class="limit">100</a>
                </div>
                <script>
                   bindEvents("chemicals", "chemical_name");
                </script>
            </div> <!-- row-fluid -->
        </div>
        <?php $this->Js->writeBuffer(); ?>
    </body>
</html>

<!-- Function to call to enable tooltip feature -->
<script type = "text/javascript">
	$(function(){
		$("[rel='tooltip']").tooltip()
	});
</script>

<!-- Including necessary javascript for bootstrap tooltip - Joie Murphy -->
<script language='javascript' src='<?=$this->webroot?>js/jquery.js'></script>
<script language='javascript' src='<?=$this->webroot?>js/bootstrap-alert.js'></script>
<script language='javascript' src='<?=$this->webroot?>js/bootstrap-modal.js'></script>
<script language='javascript' src='<?=$this->webroot?>js/bootstrap-transition.js'></script>
<script language='javascript' src='<?=$this->webroot?>js/bootstrap-tooltip.js'></script>
