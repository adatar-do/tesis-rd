# Tesis RD: que el formato no sea un problema y el código no te quite el sueño

> Extensión para [Quarto](https://quarto.org/)

----

<!-- BADGES -->
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/adatar-do/tesis-rd?include_prereleases)]()
[![GitHub Repo stars](https://img.shields.io/github/stars/adatar-do/tesis-rd?style=social)]()
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![GitHub issues](https://img.shields.io/github/issues/adatar-do/tesis-rd)]()
[![GitHub last commit](https://img.shields.io/github/last-commit/adatar-do/tesis-rd)]()
[![GitHub contributors](https://img.shields.io/github/contributors/adatar-do/tesis-rd)]()
<!-- END BADGES -->

----

`tesis-rd` facilita la utilización de Quarto para la generación de tesis con los formatos de las distintas instituciones de educación superior de República Dominicana.

Al utilizar `tesis-rd` no tendrás que preocuparte por el formato de la tesis, ya que este se encarga de generarla en el formato requerido por la institución de educación superior que elijas, cada vez que generes el documento.

Además, al estar basado en Quarto, `tesis-rd` te permite utilizar <a href="https://adatar.do/blog/quarto/programacion-literaria-como-tenia-que-ser.html"> programación literaria</a> para generar tus gráficos, tablas y demás elementos de la tesis, con todos los beneficios que esto conlleva.

----

## Change Log

> **Importante**
> <br/> Este proyecto está en desarrollo y puede cambiar en cualquier momento. A continuación, se muestran los cambios que se han realizado en cada versión.

> **Versión 1.0.0-beta** (Octubre 2022)
> - Primer release de la extensión.

> **Versión 1.0.0** (Enero 2023)
- Esta versión es compatible con Quarto 1.2.198 o superior.
- Se agregó la formato PDF del Instituto Tecnológico de Santo Domingo (INTEC).
- Se realizaron los siguientes cambios en todas los formatos:
  - Se eliminó el argumento `advisers` del header del documento. Los asesores se agregan en el argumento `author` del header del documento con el siguiente formato:
    ```yaml
    ...
    author: 
    - name: "Daniel E. de la Rosa"
      id: 1041951
    - name: "Juan Pérez"
      id: false
    ...
    ```
  - Se agregaron los argumentos `ies` y `city` al header del documento.
    ```yaml	
    ...
    ies: "Nombre de la IES"
    ...
    city: "Santo Domingo, República Dominicana"
    ...
    ```
  - Se realizaron otros cambios menores a nivel de la extensión y de los formatos.

----

## Instalación

> Si no sabes que es **Quarto** inicia aquí: [https://adatar.do/blog/quarto/mas-que-rmarkdown-2.0.html](https://adatar.do/blog/quarto/mas-que-rmarkdown-2.0.html)

**Instalación de Quarto:**

Sigue los pasos indicados aquí para [instalar Quarto](https://quarto.org/docs/get-started/) en tu sistema operativo.

**Opción 1:** Si ya iniciaste tu proyecto, ejecute el siguiente comando en la línea de comandos:

```bash
quarto install extension adatar-do/tesis-rd
```

**Opción 2:** Si no has iniciado tu proyecto aún, puedes hacerlo con el siguiente comando:

```bash
quarto use template adatar-do/tesis-rd
```

## Uso

<br />

> **Consulte la guía de usuario (#TODO) para obtener más información sobre el uso de `tesis-rd`. ([https://adatar.do/blog/tesis-rd/guia-usuario.html](https://adatar.do/blog//tesis-rd/guia-usuario.html))**

<br/>

> **Consulte la documentación de cada formato (#TODO), en la tabla a continuación, para obtener más información sobre el uso de `tesis-rd` con cada formato.**

| Institución de Educación Superior | Autor | Documentación |
| --------------------------------- | ----- | ------------- |
| Instituto Tecnológico de Santo Domingo (INTEC) | [Daniel E. de la Rosa](https://dnldelarosa.com/) | [https://adatar.do/blog/tesis-rd/intec.html](https://adatar.do/blog/tesis-rd/intec.html) |

<br />

> **A continuación, se muestran los pasos para utilizar `tesis-rd` con el formato del Instituto Tecnológico de Santo Domingo (INTEC). Pero, el proceso es similar para los "demás" formatos.**

<br />

- Si **Intalación -> Opción 2**, puedes comenzar a trabajar con el documento `template.qmd` y reemplazar las partes correspondientes. 
- Si **Instalación -> Opción 1**, cambia el header del documento a:

  ```yaml
  ---
  title: "Tesis-RD: A Quarto Extension"
  subtitle: "Que el formato no sea un problema y el código no te quite el sueño"
  author: 
      - name: "Daniel E. de la Rosa"
        id: 1041951
      - name: "Juan Pérez"
        id: false
  ies: "Instituto Tecnológico de Santo Domingo"
  area: Área de ingenierías
  program: "Maestría en Ciencia de Datos (MCD)"
  degree: "Magíster en Ciencia de Datos"
  city: "Santo Domingo, República Dominicana"
  abstracts:
      - title: Resumen
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sollicitudin ligula eu leo tincidunt, quis scelerisque magna dapibus. Sed eget ipsum vel arcu vehicula ullamcorper"
        keywords:
          - title: "Palabras clave"
            content: "Visión computacional, georreferenciación"
      - title: Abstract
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sollicitudin ligula eu leo tincidunt, quis scelerisque magna dapibus. Sed eget ipsum vel arcu vehicula ullamcorper"
        keywords:
          - title: "Keywords"
            content: "Computer vision, georeferencing"
  date: today
  format:
    intec-pdf: default
    intec-docx: default
    intec-html: default
  execute: 
    cache: true
  bibliography: bibliography.bib
  ---
  ```

Note que el argumento `format` tiene tres formatos:

- `intec-html`: para generar el documento en formato HTML que puede ir visualizando mientras escribe su tesis.
- `intec-pdf`: para generar el documento en formato PDF que puede enviar a la institución para su revisión.
- `intec-docx`: para generar el documento en formato DOCX que puede enviar a la institución para su revisión.

> **Asegúrese de colocar el formato intec-pdf o intec-docx primero cuando quiera generar el documento final.** <!-- Además de cambiar el argumento `draft` a `false` para eliminar la marca de agua del documento. -->

> **Tabla de contenidos** <br />
Nótese que el argumento `toc` fue omitido en el header. Esto así porque `tesis-rd` ya incluye una tabla de contenidos en el formato del INTEC. Excepto en el formato DOCX, donde la tabla se debe insertar manualmente en el lugar indicado.

## Licencia

Este proyecto está bajo la licencia MIT. Consulte el archivo [LICENSE](LICENSE) para obtener más información.

## Contribución

Las contribuciones son lo que hacen que la comunidad de código abierto sea un lugar increíble para aprender, inspirar y crear. Cualquier contribución que hagas es **muy apreciada**.

>  La contribución más básica que puedes hacer es regalar una estrella a este proyecto. :star:

Pero, si quieres contribuir de forma más activa, puedes hacerlo de las siguientes maneras:

1. Asegúrese de entender cómo crear una extensión para Quarto [aquí](https://quarto.org/docs/extensions/formats.html).
1. Revise la guía de usuario (#TODO) para ver como crear un nuevo formato.
1. Haga un fork del proyecto
2. Cree una rama con el nombre de la tesis que deseas agregar (`git checkout -b XXXX`)
3. Confirme sus cambios (`git commit -m 'tesis-XXXX agregada'`)
4. Suba sus cambios (`git push origin XXXX`)
5. Abra una solicitud de extracción (Pull Request)

> **Nota**: Si no está seguro de cómo hacerlo, puede abrir un problema (issue) [en el repositorio](https://github.com/adatar-do/tesis-rd/issues) y de seguro alguien lo hará por usted. ¡Esa es la magia de la comunidad de código abierto!


# Ejemplos 

## INTEC

<img src="https://raw.githubusercontent.com/adatar-do/tesis-rd/main/images/template_Page_1.png" style="border: 1px solid;" />

<img src="https://raw.githubusercontent.com/adatar-do/tesis-rd/main/images/template_Page_2.png" style="border: 1px solid;" />

<img src="https://raw.githubusercontent.com/adatar-do/tesis-rd/main/images/template_Page_3.png" style="border: 1px solid;" />



# Tesis disponibles

## INTEC

- [de la Rosa, D. & Pérez, J. (2022). Georreferenciación de imágenes utilizando visión computacional: el caso del mapa de la República Dominicana. [Trabajo final de maestría, Instituto Tecnológico de Santo Domingo (INTEC)]. https://github.com/dnldelarosa/tesis-maestria-ciencia-datos](https://github.com/dnldelarosa/tesis-maestria-ciencia-datos)
