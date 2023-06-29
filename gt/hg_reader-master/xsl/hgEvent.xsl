<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl" exclude-result-prefixes="php">
  <xsl:output method="xml" encoding="utf-8" indent="no" omit-xml-declaration="yes"/>
  <xsl:param name="owner" select="'GT Communications and Marketing'"/>

  <xsl:variable name="base_path" select="php:functionString('base_path')" />
  
  <xsl:template match="/node">
    <div class="fullPanel">
      <h2><xsl:value-of select="title" /></h2>
      
      <!-- Event Details -->
        <div class="hg-sidebar">
          <h3>Event Details</h3>
          <ul class="itemlist">
            <li><strong>Date/Time:</strong>
              <br />
              
              <!-- setting variables for start date -->
              <xsl:variable name="start_date" select="php:functionString('hg_reader_XSLDateTimeXfer','fullDateString',field_time/item/value)" />
              <xsl:variable name="start_year" select="php:functionString('hg_reader_XSLDateTimeXfer','yearLong',field_time/item/value)" />
              <xsl:variable name="start_month" select="php:functionString('hg_reader_XSLDateTimeXfer','monthStringLong',field_time/item/value)" />
              <xsl:variable name="start_day" select="php:functionString('hg_reader_XSLDateTimeXfer','dayDigitShort',field_time/item/value)" />
              <xsl:variable name="start_time_digit" select="php:functionString('hg_reader_XSLDateTimeXfer','fullTimeDigit',field_time/item/value)" /> 
              <xsl:variable name="start_time_string" select="php:functionString('hg_reader_XSLDateTimeXfer','fullTimeString',field_time/item/value)" /> 
              
              <!-- setting variables for stop date -->
              <xsl:variable name="stop_date" select="php:functionString('hg_reader_XSLDateTimeXfer','fullDateString',field_time/item/value2)" />
              <xsl:variable name="stop_year" select="php:functionString('hg_reader_XSLDateTimeXfer','yearLong',field_time/item/value2)" />
              <xsl:variable name="stop_month" select="php:functionString('hg_reader_XSLDateTimeXfer','monthStringLong',field_time/item/value2)" />
              <xsl:variable name="stop_day" select="php:functionString('hg_reader_XSLDateTimeXfer','dayDigitShort',field_time/item/value2)" />
              <xsl:variable name="stop_time_digit" select="php:functionString('hg_reader_XSLDateTimeXfer','fullTimeDigit',field_time/item/value2)" /> 
              <xsl:variable name="stop_time_string" select="php:functionString('hg_reader_XSLDateTimeXfer','fullTimeString',field_time/item/value2)" /> 
              
              <xsl:if test="$start_date = $stop_date">
                <xsl:value-of select="php:functionString('hg_reader_XSLDateTimeXfer','fullDateString',field_time/item/value)" />
              </xsl:if>
    
              <xsl:if test="$start_date != $stop_date">
                <xsl:if test="($start_year = $stop_year) and ($start_month = $stop_month)">
                  <xsl:value-of select="$start_month" />
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="$start_day" />
                  -
                  <xsl:value-of select="$stop_day" />
                  ,
                  <xsl:value-of select="$start_year" />
                </xsl:if>
    
                <xsl:if test="($start_year != $stop_year) or ($start_month != $stop_month)">
                  <xsl:value-of select="$start_date" /> - <xsl:value-of select="$stop_date" />          
                </xsl:if>            
              </xsl:if>
              
              <br />
              
              <xsl:value-of select="$start_time_string" />
              <xsl:if test="($start_time_digit != $stop_time_digit) and ($stop_time_digit != '00:00:00')">
                <xsl:text> - </xsl:text> 
                <xsl:value-of select="$stop_time_string" />
              </xsl:if>              
            </li>
            <xsl:if test="string(field_location/item/value)">
              <li>
                <strong>Location:</strong>
                <br />
                <xsl:choose>
                  <xsl:when test="string(field_url/item/url)">
                    <a href="{field_url/item/url}"><xsl:value-of select="field_location/item/value" /></a>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="field_location/item/value" />
                  </xsl:otherwise>
                </xsl:choose>
              </li>
            </xsl:if>
            <xsl:if test="string(field_phone/item/value)">
              <li><strong>Phone:</strong>
              <br />
              <xsl:value-of select="field_phone/item/value" /></li>
            </xsl:if>
            <xsl:if test="string(field_email/item/email)">
              <li><strong>Email:</strong>
              <br />
              <a href="mailto:{field_email/item/email}"><xsl:value-of select="field_email/item/email" /></a></li>
            </xsl:if>
            <xsl:if test="string(field_fee/item/value)">
              <li><strong>Fee(s):</strong>
              <br />
              <xsl:value-of select="field_fee/item/value" /></li>
            </xsl:if>
            <xsl:if test="string(field_extras/item/value)">
              <li><strong>Extras:</strong>
              <br />
                <xsl:for-each select="field_extras/item">
                  - <xsl:value-of select="value" />
                </xsl:for-each>
              </li>
            </xsl:if>
            <li>
              <a href="subscribe.php?format=ics&amp;nid={nid}" title="Download a .vcs file for this event">
              <img src="http://www.gatech.edu/images/iconIcal.gif" alt="Download a .vcs file for this event" />
              </a>
            </li>
          </ul>
        </div>
        
        <!-- Contact Info -->
        <div class="hg-sidebar">
            <h4>For More Information Clontact</h4>
            <xsl:value-of disable-output-escaping="yes" select="field_contact/item/value" />
        </div>
        
        <!-- Related Media -->
        <xsl:if test="field_media/item/nid/node">
          <div class="hg-sidebar">                  
            <h3>Related Media</h3>
            <p>Click on image(s) to view larger version(s)</p>
            <ul class="itemList">
              <xsl:for-each select="field_media/item">
                  <xsl:choose>
                    <xsl:when test="nid/node/type='image'">
                      <!-- Related photos -->
                      <li class="clearfix">
                        <a href="{$base_path}hg/image/{nid/node/nid}" title="{nid/node/title}">
                          <img src="{$base_path}hg/image/{nid/node/nid}&amp;f=thumbnail_scaled" alt="{nid/node/title}" />
                        </a> 
                        <p>
                          <xsl:value-of disable-output-escaping="yes" select="nid/node/title" />
                          <br />
                          <xsl:if test="nid/node/field_image/item/filemime!=''">
                            <em>(<xsl:value-of disable-output-escaping="yes" select="nid/node/field_image/item/filemime" />)</em>
                          </xsl:if>
                        </p>
                      </li>
                    </xsl:when>
                    <xsl:otherwise>
                      <!-- Related .mov/.mp4/.avi/.swf files -->
                      <xsl:if test="nid/node/field_video/item/fid">
                        <li class="clearfix">
                          <!-- 
                          * The width and height of the file are stored in {nid/node/field_width/item/value} and {nid/node/field_height/item/value}
                          * (see width/height variables below)
                          * Note that the below code is using the hgReader_file function to serve the video file for download.
                          * If you want to play the clip on your site (such as with flowplayer: http://www.flowplayer.org),
                          * it's best to link directly to the original file on gatech.edu, such as:
                          * http://www.gatech.edu/hgsites/<xsl:value-of disable-output-escaping="yes" select="$video_file_path" />
                          -->
                          <xsl:variable name="video_file_name" select="php:functionString('urlencode',nid/node/field_video/item/filename)" />
                          <xsl:variable name="video_file_mime" select="php:functionString('urlencode',nid/node/field_video/item/filemime)" />
                          <xsl:variable name="video_file_path" select="php:functionString('urlencode',nid/node/field_video/item/filepath)" />
                          <xsl:variable name="video_file_width" select="nid/node/field_width/item/value" />
                          <xsl:variable name="video_file_height" select="nid/node/field_height/item/value" />
                          <xsl:variable name="vthumb_file_name" select="php:functionString('urlencode',nid/node/field_thumbnail/item/filename)" />
                          <xsl:variable name="vthumb_file_mime" select="php:functionString('urlencode',nid/node/field_thumbnail/item/filemime)" />
                          <xsl:variable name="vthumb_file_path" select="php:functionString('urlencode',concat('sites/default/files/imagecache/thumbnail_scaled/thumbnails/',nid/node/field_thumbnail/item/filename))" />
                          <a href="/hg/file?fname={$video_file_name}&amp;fmime={$video_file_mime}&amp;fpath={$video_file_path}" title="{nid/node/title}"> 
                            <img src="/hg/file?fname={$vthumb_file_name}&amp;fmime={$vthumb_file_mime}&amp;fpath={$vthumb_file_path}" width="80" />
                          </a> 
                          <p>
                            <xsl:value-of disable-output-escaping="yes" select="nid/node/title" />
                            <br />
                            <em>(Video <xsl:value-of disable-output-escaping="yes" select="$video_file_width" /> x <xsl:value-of disable-output-escaping="yes" select="$video_file_height" />)</em>
                          </p>
                        </li>
                      </xsl:if>
                      <!-- Related .mov/.mp4/.avi/.swf files -->
                      <xsl:if test="nid/node/field_flash/item/fid">
                        <li class="clearfix">
                          <!-- 
                          * The width and height of the file are stored in {nid/node/field_width/item/value} and {nid/node/field_height/item/value}
                          * (see width/height variables below)
                          * Note that the below code is using the hgReader_file function to serve the video file for download.
                          * If you want to play the clip on your site (such as with flowplayer: http://www.flowplayer.org),
                          * it's best to link directly to the original file on gatech.edu, such as:
                          * http://www.gatech.edu/hgsites/<xsl:value-of disable-output-escaping="yes" select="$video_file_path" />
                          -->
                          <xsl:variable name="flv_file_name" select="php:functionString('urlencode',nid/node/field_flash/item/filename)" />
                          <xsl:variable name="flv_file_mime" select="php:functionString('urlencode',nid/node/field_flash/item/filemime)" />
                          <xsl:variable name="flv_file_path" select="php:functionString('urlencode',nid/node/field_flash/item/filepath)" />
                          <xsl:variable name="flv_file_width" select="nid/node/field_width/item/value" />
                          <xsl:variable name="flv_file_height" select="nid/node/field_height/item/value" />
                          <xsl:variable name="fthumb_file_name" select="php:functionString('urlencode',nid/node/field_thumbnail/item/filename)" />
                          <xsl:variable name="fthumb_file_mime" select="php:functionString('urlencode',nid/node/field_thumbnail/item/filemime)" />
                          <xsl:variable name="fthumb_file_path" select="php:functionString('urlencode',concat('sites/default/files/imagecache/thumbnails/thumbnails/',nid/node/field_thumbnail/item/filename))" />
                          <a href="/hg/file?fname={$flv_file_name}&amp;fmime={$flv_file_mime}&amp;fpath={$flv_file_path}" title="{nid/node/title}"> 
                            <img src="/hg/file?fname={$fthumb_file_name}&amp;fmime={$fthumb_file_mime}&amp;fpath={$fthumb_file_path}" />
                          </a> 
                          <p>
                            <xsl:value-of disable-output-escaping="yes" select="nid/node/title" />
                            <br />
                            <em>(Video <xsl:value-of disable-output-escaping="yes" select="$flv_file_width" /> x <xsl:value-of disable-output-escaping="yes" select="$flv_file_height" />)</em>
                          </p>
                        </li>
                      </xsl:if>
                    </xsl:otherwise>
                  </xsl:choose>
              </xsl:for-each>
            </ul>
          </div>
        </xsl:if>
          
        <!-- Related Files -->
        <xsl:if test="files/item/fid">
          <div class="hg-sidebar">
            <h3>Related Files</h3>
            <ul id="itemList">
              <xsl:for-each select="files/item">
                <li class="clearfix">
                  <p>
                  <xsl:variable name="file_name" select="php:functionString('urlencode',filename)" />
                  <xsl:variable name="file_mime" select="php:functionString('urlencode',filemime)" />
                  <xsl:variable name="file_path" select="php:functionString('urlencode',filepath)" />
                  <xsl:choose>
                    <xsl:when test="description != ''">
                      <a href="/hg/file?fname={$file_name}&amp;fmime={$file_mime}&amp;fpath={$file_path}"><xsl:value-of disable-output-escaping="yes" select="description" /></a>
                    </xsl:when>
                    <xsl:otherwise>
                      <a href="/hg/file?fname={$file_name}&amp;fmime={$file_mime}&amp;fpath={$file_path}"><xsl:value-of disable-output-escaping="yes" select="filename" /></a>
                    </xsl:otherwise>
                  </xsl:choose>
                  <em>
                  <xsl:choose>
                    <xsl:when test="filesize &gt; 999999">
                    (<xsl:value-of disable-output-escaping="yes" select="round(filesize div 1000000)" />MB
                    </xsl:when>
                    <xsl:otherwise>
                    (<xsl:value-of disable-output-escaping="yes" select="round(filesize div 1000)" />k
                    </xsl:otherwise>
                  </xsl:choose>
                  <xsl:if test="filemime != ''">
                    <xsl:value-of disable-output-escaping="yes" select="filemime" />
                  </xsl:if>
                  )</em>
                  </p>
                </li>
              </xsl:for-each>
            </ul>
          </div>
        </xsl:if>
        
        <!-- Body Text --> 
        <xsl:value-of disable-output-escaping="yes" select="body" />
        
        <!-- Related Links -->
        <xsl:if test="links_related/item">
          <div class="relatedLinks">
            <h4>Related Links</h4>
            <ul>
              <xsl:for-each select="links_related/item">
                <li>
                  <a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="url" />
                    </xsl:attribute>
                    <xsl:value-of disable-output-escaping="yes" select="link_title" />
                  </a>                      
                </li>
              </xsl:for-each>
            </ul>
          </div>
        </xsl:if>
        
        <!-- Boilerplate -->
        <xsl:if test="field_boilerplate/item/nid/node">
          <div class="boilerplate">
            <xsl:value-of disable-output-escaping="yes" select="field_boilerplate/item/nid/node/body" />
          </div>
        </xsl:if>
      <hr />
    </div>
  </xsl:template>
</xsl:stylesheet>