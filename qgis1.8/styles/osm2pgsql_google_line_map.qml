<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="1.8.0-Lisboa" minimumScale="0" maximumScale="1e+08" hasScaleBasedVisibilityFlag="0">
  <transparencyLevelInt>255</transparencyLevelInt>
  <renderer-v2 symbollevels="0" type="RuleRenderer">
    <rules>
      <rule scalemaxdenom="30000" filter=" &quot;highway&quot;  IN ( 'motorway')" symbol="0" label="Motorway"/>
      <rule filter=" &quot;highway&quot;  IN ( 'motorway')" symbol="1" scalemindenom="30000" label="Motorway Zoomed"/>
      <rule scalemaxdenom="30000" filter=" &quot;highway&quot;  IN ( 'motorway') and &quot;bridge&quot; IN ( 'yes','viaduct')" symbol="2" label="Motorway Bridge"/>
      <rule scalemaxdenom="30000" filter=" &quot;highway&quot;  IN ( 'trunk')" symbol="3" label="Trunk"/>
      <rule filter=" &quot;highway&quot;  IN ( 'trunk')" symbol="4" scalemindenom="30000" label="Trunk Zoomed"/>
      <rule scalemaxdenom="30000" filter=" &quot;highway&quot;  IN ( 'motorway_link')" symbol="5" label="Motorway Links"/>
      <rule filter=" &quot;highway&quot;  IN ( 'motorway_link')" symbol="6" scalemindenom="30000" label="Motorway Links Zoomed"/>
      <rule scalemaxdenom="30000" filter=" &quot;highway&quot;  IN ( 'trunk') and &quot;bridge&quot; IN ( 'yes', 'viaduct')" symbol="7" label="Trunk Bridge"/>
      <rule scalemaxdenom="30000" filter=" &quot;highway&quot;  IN ( 'primary','primary_link')" symbol="8" label="Primary"/>
      <rule filter=" &quot;highway&quot;  IN ( 'primary','primary_link')" symbol="9" scalemindenom="30000" label="Primary Zoomed"/>
      <rule scalemaxdenom="30000" filter=" &quot;highway&quot;  IN ( 'primary','primary_link') and &quot;bridge&quot; IN ( 'yes', 'viaduct')" symbol="10" label="Primary Bridge"/>
      <rule scalemaxdenom="30000" filter=" &quot;highway&quot;  IN ( 'secondary','secondary_link')" symbol="11" label="Secondary"/>
      <rule scalemaxdenom="500000" filter=" &quot;highway&quot;  IN ( 'secondary','secondary_link')" symbol="12" scalemindenom="30000" label="Secondary Zoomed"/>
      <rule scalemaxdenom="30000" filter=" &quot;highway&quot;  IN ( 'secondary','secondary_link') and &quot;bridge&quot; IN ( 'yes', 'viaduct')" symbol="13" label="Secondary Bridge"/>
      <rule scalemaxdenom="30000" filter=" &quot;highway&quot;  IN ( 'tertiary')" symbol="14" label="Tertiary"/>
      <rule scalemaxdenom="500000" filter=" &quot;highway&quot;  IN ( 'tertiary')" symbol="15" scalemindenom="30000" label="Tertiary Zoomed"/>
      <rule scalemaxdenom="30000" filter=" &quot;highway&quot;  IN ('residential')" symbol="16" label="Road"/>
      <rule scalemaxdenom="80000" filter=" &quot;highway&quot;  IN ('residential')" symbol="17" scalemindenom="30000" label="Roads Zoomed"/>
      <rule scalemaxdenom="250000" filter=" &quot;highway&quot;  IN ('residential')" symbol="18" scalemindenom="80000" label="Roads Zoomed Way Out"/>
      <rule scalemaxdenom="350000" filter=" &quot;highway&quot;  IN ('residential')" symbol="19" scalemindenom="250000" label="Road Zoomed Way Way Out"/>
      <rule scalemaxdenom="50000" filter=" &quot;highway&quot;  IN ('service', 'road', 'unclassified', 'track')" symbol="20" scalemindenom="1000" label="Small Road"/>
      <rule scalemaxdenom="50000" filter="&quot;highway&quot; IN ('footway', 'path')" symbol="21" scalemindenom="1000" label="Paths"/>
      <rule filter="&quot;highway&quot; IN ('footway', 'path') and &quot;bridge&quot; = 'yes'" symbol="22" label="Path Bridges"/>
      <rule scalemaxdenom="150000" filter=" &quot;railway&quot;  = 'rail'" symbol="23" label="Railroad"/>
      <rule scalemaxdenom="150000" filter=" &quot;railway&quot;  = 'rail' and &quot;bridge&quot; = 'yes'" symbol="24" label="Railroad Bridge"/>
      <rule scalemaxdenom="200000" filter=" &quot;aeroway&quot; = 'taxiway'" symbol="25" label="Airport Taxiway"/>
      <rule scalemaxdenom="200000" filter=" &quot;aeroway&quot; = 'runway'" symbol="26" label="Airport Runway"/>
      <rule scalemaxdenom="350000" filter=" &quot;aeroway&quot; = 'runway'" symbol="27" scalemindenom="200000" label="Airport Runway Zoomed"/>
    </rules>
    <symbols>
      <symbol outputUnit="MM" alpha="1" type="line" name="0">
        <layer pass="6" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="2"/>
        </layer>
        <layer pass="7" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="225,132,51,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.8"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="1">
        <layer pass="6" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.4"/>
        </layer>
        <layer pass="7" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="225,132,51,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.2"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="10">
        <layer pass="7" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="120,120,120,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="2.2"/>
        </layer>
        <layer pass="8" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="230,255,139,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.8"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="11">
        <layer pass="4" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.7"/>
        </layer>
        <layer pass="5" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="255,251,137,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.5"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="12">
        <layer pass="4" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1"/>
        </layer>
        <layer pass="5" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="255,251,137,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.8"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="13">
        <layer pass="7" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="120,120,120,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.8"/>
        </layer>
        <layer pass="8" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="255,251,137,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.5"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="14">
        <layer pass="2" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.5"/>
        </layer>
        <layer pass="3" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="255,255,255,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.3"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="15">
        <layer pass="1" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.9"/>
        </layer>
        <layer pass="2" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="255,255,255,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.7"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="16">
        <layer pass="1" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.3"/>
        </layer>
        <layer pass="2" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="255,255,255,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="17">
        <layer pass="1" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.5"/>
        </layer>
        <layer pass="2" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="255,255,255,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.3"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="18">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="209,209,209,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.4"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="19">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="209,209,209,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.2"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="2">
        <layer pass="7" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="120,120,120,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="2.2"/>
        </layer>
        <layer pass="8" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="225,132,51,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.8"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="20">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="209,209,209,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.4"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="0.486275" type="line" name="21">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="132,158,126,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="dash"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.26"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="22">
        <layer pass="7" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="120,120,120,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.4"/>
        </layer>
        <layer pass="8" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="255,255,255,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.32"/>
        </layer>
        <layer pass="9" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="132,158,126,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="dash"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.26"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="23">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="196,196,196,255"/>
          <prop k="customdash" v="1;1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="dot"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width" v="0.26"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="24">
        <layer pass="7" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="164,164,164,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.5"/>
        </layer>
        <layer pass="8" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="255,255,255,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.4"/>
        </layer>
        <layer pass="9" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="196,196,196,255"/>
          <prop k="customdash" v="1;1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="dot"/>
          <prop k="use_custom_dash" v="1"/>
          <prop k="width" v="0.26"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="25">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="200,200,200,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.75"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="26">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="200,200,200,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="2"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="27">
        <layer pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="color" v="200,200,200,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="3">
        <layer pass="3" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="2"/>
        </layer>
        <layer pass="4" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="225,223,105,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.8"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="4">
        <layer pass="3" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.2"/>
        </layer>
        <layer pass="4" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="225,223,105,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="5">
        <layer pass="3" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.2"/>
        </layer>
        <layer pass="4" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="225,161,105,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="6">
        <layer pass="3" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.8"/>
        </layer>
        <layer pass="4" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="225,161,105,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.6"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="7">
        <layer pass="6" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="52,52,52,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="2"/>
        </layer>
        <layer pass="7" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="225,223,105,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.8"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="8">
        <layer pass="5" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="2"/>
        </layer>
        <layer pass="6" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="230,255,139,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.8"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="line" name="9">
        <layer pass="5" class="SimpleLine" locked="0">
          <prop k="capstyle" v="flat"/>
          <prop k="color" v="143,143,143,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="1.1"/>
        </layer>
        <layer pass="6" class="SimpleLine" locked="0">
          <prop k="capstyle" v="round"/>
          <prop k="color" v="230,255,139,255"/>
          <prop k="customdash" v="5;2"/>
          <prop k="joinstyle" v="round"/>
          <prop k="offset" v="0"/>
          <prop k="penstyle" v="solid"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width" v="0.9"/>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <customproperties>
    <property key="labeling" value="pal"/>
    <property key="labeling/addDirectionSymbol" value="false"/>
    <property key="labeling/bufferColorB" value="255"/>
    <property key="labeling/bufferColorG" value="255"/>
    <property key="labeling/bufferColorR" value="255"/>
    <property key="labeling/bufferSize" value="0.25"/>
    <property key="labeling/dataDefinedProperty0" value=""/>
    <property key="labeling/dataDefinedProperty1" value=""/>
    <property key="labeling/dataDefinedProperty10" value=""/>
    <property key="labeling/dataDefinedProperty11" value=""/>
    <property key="labeling/dataDefinedProperty12" value=""/>
    <property key="labeling/dataDefinedProperty13" value=""/>
    <property key="labeling/dataDefinedProperty14" value=""/>
    <property key="labeling/dataDefinedProperty2" value=""/>
    <property key="labeling/dataDefinedProperty3" value=""/>
    <property key="labeling/dataDefinedProperty4" value=""/>
    <property key="labeling/dataDefinedProperty5" value=""/>
    <property key="labeling/dataDefinedProperty6" value=""/>
    <property key="labeling/dataDefinedProperty7" value=""/>
    <property key="labeling/dataDefinedProperty8" value=""/>
    <property key="labeling/dataDefinedProperty9" value=""/>
    <property key="labeling/decimals" value="0"/>
    <property key="labeling/dist" value="0"/>
    <property key="labeling/distInMapUnits" value="false"/>
    <property key="labeling/enabled" value="true"/>
    <property key="labeling/fieldName" value="CASE WHEN ( &quot;highway&quot; = 'motorway') THEN  &quot;ref&quot; ELSE &quot;name&quot; END"/>
    <property key="labeling/fontFamily" value="MS Shell Dlg 2"/>
    <property key="labeling/fontItalic" value="false"/>
    <property key="labeling/fontSize" value="8"/>
    <property key="labeling/fontSizeInMapUnits" value="false"/>
    <property key="labeling/fontStrikeout" value="false"/>
    <property key="labeling/fontUnderline" value="false"/>
    <property key="labeling/fontWeight" value="50"/>
    <property key="labeling/formatNumbers" value="false"/>
    <property key="labeling/isExpression" value="true"/>
    <property key="labeling/labelPerPart" value="false"/>
    <property key="labeling/mergeLines" value="false"/>
    <property key="labeling/minFeatureSize" value="1"/>
    <property key="labeling/obstacle" value="true"/>
    <property key="labeling/placement" value="3"/>
    <property key="labeling/placementFlags" value="9"/>
    <property key="labeling/plussign" value="true"/>
    <property key="labeling/priority" value="5"/>
    <property key="labeling/scaleMax" value="0"/>
    <property key="labeling/scaleMin" value="0"/>
    <property key="labeling/textColorB" value="20"/>
    <property key="labeling/textColorG" value="20"/>
    <property key="labeling/textColorR" value="20"/>
    <property key="labeling/wrapChar" value=""/>
  </customproperties>
  <displayfield>name</displayfield>
  <label>0</label>
  <labelfield>ref</labelfield>
  <labelattributes>
    <label fieldname="ref" text=""/>
    <family fieldname="" name="MS Shell Dlg 2"/>
    <size fieldname="" units="pt" value="8"/>
    <bold fieldname="" on="1"/>
    <italic fieldname="" on="0"/>
    <underline fieldname="" on="0"/>
    <strikeout fieldname="" on="0"/>
    <color fieldname="" red="255" blue="255" green="255"/>
    <x fieldname=""/>
    <y fieldname=""/>
    <offset x="4.25" y="4.5" units="pt" yfieldname="" xfieldname=""/>
    <angle fieldname="" value="0" auto="0"/>
    <alignment fieldname="" value="center"/>
    <buffercolor fieldname="" red="34" blue="34" green="34"/>
    <buffersize fieldname="" units="pt" value="1"/>
    <bufferenabled fieldname="" on="1"/>
    <multilineenabled fieldname="" on=""/>
    <selectedonly on=""/>
  </labelattributes>
  <edittypes>
    <edittype type="0" name="access"/>
    <edittype type="0" name="addr:flats"/>
    <edittype type="0" name="addr:housenumber"/>
    <edittype type="0" name="addr:interpolation"/>
    <edittype type="0" name="admin_level"/>
    <edittype type="0" name="aerialway"/>
    <edittype type="0" name="aeroway"/>
    <edittype type="0" name="amenity"/>
    <edittype type="0" name="area"/>
    <edittype type="0" name="barrier"/>
    <edittype type="0" name="bicycle"/>
    <edittype type="0" name="boundary"/>
    <edittype type="0" name="bridge"/>
    <edittype type="0" name="building"/>
    <edittype type="0" name="construction"/>
    <edittype type="0" name="cutting"/>
    <edittype type="0" name="disused"/>
    <edittype type="0" name="embankment"/>
    <edittype type="0" name="foot"/>
    <edittype type="0" name="highway"/>
    <edittype type="0" name="historic"/>
    <edittype type="0" name="horse"/>
    <edittype type="0" name="junction"/>
    <edittype type="0" name="landuse"/>
    <edittype type="0" name="layer"/>
    <edittype type="0" name="learning"/>
    <edittype type="0" name="leisure"/>
    <edittype type="0" name="lock"/>
    <edittype type="0" name="man_made"/>
    <edittype type="0" name="military"/>
    <edittype type="0" name="motorcar"/>
    <edittype type="0" name="name"/>
    <edittype type="0" name="natural"/>
    <edittype type="0" name="oneway"/>
    <edittype type="0" name="operator"/>
    <edittype type="0" name="osm_id"/>
    <edittype type="0" name="osm_timestamp"/>
    <edittype type="0" name="osm_uid"/>
    <edittype type="0" name="osm_user"/>
    <edittype type="0" name="osm_version"/>
    <edittype type="0" name="place"/>
    <edittype type="0" name="power"/>
    <edittype type="0" name="power_source"/>
    <edittype type="0" name="railway"/>
    <edittype type="0" name="ref"/>
    <edittype type="0" name="religion"/>
    <edittype type="0" name="residence"/>
    <edittype type="0" name="route"/>
    <edittype type="0" name="service"/>
    <edittype type="0" name="shop"/>
    <edittype type="0" name="sport"/>
    <edittype type="0" name="surface_type"/>
    <edittype type="0" name="tourism"/>
    <edittype type="0" name="tracktype"/>
    <edittype type="0" name="tunnel"/>
    <edittype type="0" name="waterway"/>
    <edittype type="0" name="way_area"/>
    <edittype type="0" name="width"/>
    <edittype type="0" name="wood"/>
    <edittype type="0" name="z_order"/>
  </edittypes>
  <editform>.</editform>
  <editforminit></editforminit>
  <annotationform>.</annotationform>
  <attributeactions/>
  <overlay display="false" type="diagram">
    <renderer item_interpretation="linear">
      <diagramitem size="0" value="0"/>
      <diagramitem size="0" value="0"/>
    </renderer>
    <factory sizeUnits="MM" type="Pie">
      <wellknownname>Pie</wellknownname>
      <classificationfield>0</classificationfield>
    </factory>
    <scalingAttribute>0</scalingAttribute>
  </overlay>
</qgis>
