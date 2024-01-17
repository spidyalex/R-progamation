# Cargar bibliotecas
library(clusterProfiler)
library(org.Hs.eg.db)
library(stringr)

# Vector de genes de interés
top10_genes_metrica <- c("YWHAG", "SYNJ1", "SNAP91", "GLRB", "GUCY1B1", "REEP5", "WDR47", "GABRG2", "NSF", "NECAP1")


# Filtrar el conjunto de genes de interés para aquellos que están en los datos de anotación (si es necesario)
# top10_genes_grado <- genes_interes_sd[genes_interes_sd %in% tus_datos_de_anotacion$Gene_ID]

# Realizar el análisis de enriquecimiento para la métrica "grado"
enrich_results <- enrichGO(
  gene = top10_genes_metrica,
  OrgDb = gene_db,
  keyType = "SYMBOL",
  ont = "BP",
  pvalueCutoff = 0.05,
  qvalueCutoff = 0.05
)

# Crear un dataframe con los resultados
resultados_dataframe <- as.data.frame(enrich_results)

# Guardar el dataframe en un archivo CSV
output_csv_file <- "/datos/home/alejandra2/Análisis topológico/AD_resultados/Files/enr_grado.csv"
write.csv(resultados_dataframe, file = output_csv_file, row.names = FALSE)