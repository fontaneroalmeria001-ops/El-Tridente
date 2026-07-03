<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:s="http://www.sitemaps.org/schemas/sitemap/0.9">
<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html lang="es">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<title>Sitemap · Fontaneros Almería | El Tridente</title>
<style>
*{box-sizing:border-box}
body{font-family:'Manrope','Segoe UI',system-ui,sans-serif;margin:0;background:#f6f8fb;color:#1e293b;line-height:1.55}
.wrap{max-width:1200px;margin:0 auto;padding:32px 20px}
header{background:linear-gradient(135deg,#0b3a66,#1a5491);color:#fff;padding:36px 20px;border-radius:14px;margin-bottom:24px;box-shadow:0 6px 24px rgba(11,58,102,.12)}
header h1{margin:0 0 6px;font-size:1.9rem;font-weight:800;letter-spacing:-.02em}
header p{margin:0;opacity:.92;font-size:1rem}
.count{display:inline-block;background:#f97316;color:#fff;padding:6px 14px;border-radius:24px;font-weight:800;margin-top:14px;font-size:.9rem;letter-spacing:.03em}
.filters{margin:0 0 18px;display:flex;flex-wrap:wrap;gap:8px}
.filters input{flex:1;min-width:200px;padding:12px 14px;border:1.5px solid #e2e8f0;border-radius:10px;font-family:inherit;font-size:.95rem;background:#fff}
.filters input:focus{outline:none;border-color:#f97316;box-shadow:0 0 0 3px rgba(249,115,22,.15)}
.table-wrap{background:#fff;border-radius:14px;overflow:hidden;box-shadow:0 2px 12px rgba(11,58,102,.06);border:1px solid #e2e8f0}
table{width:100%;border-collapse:collapse}
thead{background:#0b3a66;color:#fff}
thead th{padding:14px 16px;text-align:left;font-weight:700;font-size:.82rem;text-transform:uppercase;letter-spacing:.08em}
tbody tr{border-bottom:1px solid #f1f5f9;transition:background .15s}
tbody tr:hover{background:#f8fafc}
tbody td{padding:12px 16px;font-size:.93rem;vertical-align:middle}
tbody td a{color:#0b3a66;text-decoration:none;font-weight:600;word-break:break-all}
tbody td a:hover{color:#f97316;text-decoration:underline}
.badge{display:inline-block;padding:4px 10px;border-radius:20px;font-size:.75rem;font-weight:700;text-transform:uppercase;letter-spacing:.04em}
.badge.high{background:#dcfce7;color:#166534}
.badge.med{background:#fef3c7;color:#92400e}
.badge.low{background:#e0e7ff;color:#3730a3}
.section{color:#64748b;font-weight:600;font-size:.85rem}
footer{margin-top:22px;text-align:center;color:#64748b;font-size:.85rem}
footer a{color:#0b3a66;text-decoration:none;font-weight:600}
@media(max-width:640px){
  header h1{font-size:1.4rem}
  tbody td{padding:10px 12px;font-size:.85rem}
  thead th:nth-child(3),tbody td:nth-child(3){display:none}
}
</style>
</head>
<body>
<div class="wrap">
<header>
  <h1>Sitemap · Fontaneros Almería · El Tridente</h1>
  <p>Índice completo de las páginas de <strong>fontanerosalmeria.com</strong>. Este archivo lo utilizan Google, Bing y otros buscadores para indexar el sitio.</p>
  <span class="count"><xsl:value-of select="count(s:urlset/s:url)"/> URLs listadas</span>
</header>
<div class="filters">
  <input type="text" id="q" placeholder="Filtrar por palabra clave (ej: roquetas, blog, servicios)…" onkeyup="filterRows()"/>
</div>
<div class="table-wrap">
<table>
<thead>
<tr>
  <th style="width:50%">URL</th>
  <th style="width:20%">Sección</th>
  <th style="width:15%">Prioridad</th>
  <th style="width:15%">Actualizado</th>
</tr>
</thead>
<tbody id="rows">
<xsl:for-each select="s:urlset/s:url">
  <tr>
    <td>
      <a href="{s:loc}" target="_blank" rel="noopener"><xsl:value-of select="s:loc"/></a>
    </td>
    <td>
      <span class="section">
        <xsl:choose>
          <xsl:when test="contains(s:loc,'/blog/')">Blog</xsl:when>
          <xsl:when test="contains(s:loc,'/servicios/')">Servicios</xsl:when>
          <xsl:when test="contains(s:loc,'/municipios/')">Zonas</xsl:when>
          <xsl:when test="contains(s:loc,'/opiniones/')">Opiniones</xsl:when>
          <xsl:when test="contains(s:loc,'/contacto/')">Contacto</xsl:when>
          <xsl:when test="contains(s:loc,'/sobre-nosotros/')">Sobre nosotros</xsl:when>
          <xsl:when test="string-length(substring-after(s:loc,'fontanerosalmeria.com/')) = 0">Home</xsl:when>
          <xsl:otherwise>Zona</xsl:otherwise>
        </xsl:choose>
      </span>
    </td>
    <td>
      <xsl:choose>
        <xsl:when test="s:priority &gt;= 0.9"><span class="badge high"><xsl:value-of select="s:priority"/></span></xsl:when>
        <xsl:when test="s:priority &gt;= 0.7"><span class="badge med"><xsl:value-of select="s:priority"/></span></xsl:when>
        <xsl:otherwise><span class="badge low"><xsl:value-of select="s:priority"/></span></xsl:otherwise>
      </xsl:choose>
    </td>
    <td><xsl:value-of select="s:lastmod"/></td>
  </tr>
</xsl:for-each>
</tbody>
</table>
</div>
<footer>
  <p><a href="/">Volver a Fontaneros Almería · El Tridente</a></p>
</footer>
</div>
<script>
function filterRows(){
  var q=document.getElementById('q').value.toLowerCase();
  var rows=document.getElementById('rows').getElementsByTagName('tr');
  for(var i=0;i&lt;rows.length;i++){
    var t=rows[i].textContent.toLowerCase();
    rows[i].style.display = t.indexOf(q)!==-1 ? '' : 'none';
  }
}
</script>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
