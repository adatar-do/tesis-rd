# Tesis RD (extensión para [Quarto](https://quarto.org/))

<!-- Badges -->
<!-- [![GitHub release (latest by date)](https://img.shields.io/github/v/release/adatar-do/tesis-rd)]() -->
<!-- [![GitHub Release Date](https://img.shields.io/github/release-date/adatar-do/tesis-rd)]() -->
[![GitHub Repo stars](https://img.shields.io/github/stars/adatar-do/tesis-rd?style=social)]()
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![GitHub issues](https://img.shields.io/github/issues/adatar-do/tesis-rd)]()
[![GitHub last commit](https://img.shields.io/github/last-commit/adatar-do/tesis-rd)]()
[![GitHub contributors](https://img.shields.io/github/contributors/adatar-do/tesis-rd)]()
[![GitHub](https://img.shields.io/github/license/adatar-do/tesis-rd)]()
<!-- END BADGES -->

Esta extensión facilita la utilización de Quarto para la generación de tesis de las distintas instituciones de educación superior de República Dominicana.

Los siguientes formatos están disponibles:

- [Instituto Tecnológico de Santo Domingo (INTEC)](https://github.com/dnldelarosa/tesis-maestria-ciencia-datos)
    - Author: [Daniel E. de la Rosa](https://dnldelarosa.com/)

## Instalación

Si ya iniciaste tu proyecto, ejecute el siguiente comando en la línea de comandos:

```bash
quarto install extension adatar-do/tesis-rd
```

Si no has iniciado tu proyecto puedes clonar este repositorio y comenzar a trabar con el documento `template.qmd`.

## Uso

Si clonaste este repositorio, puedes comenzar a trabajar con el documento `template.qmd` y reemplazar las partes correspondientes. Si ya habías comenzado tu trabajo, cambiar el header del documento a:

```yaml
---
title: "Tesis-RD"
subtitle: "A Quarto Extension"
author: 
    - name: "Daniel E. de la Rosa"
      id: 1041951
advisers: 
    - "Juan Samuel Pérez Rodríguez"
area: Área de ingenierías
program: "Maestría en Ciencia de Datos (MCD)"
degree: "Magíster en Ciencia de Datos"
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
  intec-html: default
  intec-docx: default
bibliography: bibliografia.bib
---
```

Note que el argumento `format` tiene dos formatos:

- `intec-html`: para generar el documento en formato HTML que puede ir vizualizando mientras escribe su tesis.
- `intec-docx`: para generar el documento en formato DOCX que puede enviar a la institución para su revisión.

> Asegúrese de colocar el formato intec-docx primero cuando quiera generar el documento final.

### Tabla de contenidos

Nótese que el argumento `toc` fue omitido en el header. **No debe agregar el argumento `toc`**. Este se agrega de forma automática en el documento `html` y debe ser insertado manualmente en el documento `docx` en la posición indicada en el propio documento.

## Licencia

Este proyecto está bajo la licencia MIT. Consulte el archivo [LICENSE](LICENSE) para obtener más información.

## Contribución

Las contribuciones son lo que hacen que la comunidad de código abierto sea un lugar increíble para aprender, inspirar y crear. Cualquier contribución que hagas es **muy apreciada**.

>  La más básica contribución que puedes hacer es regalar una estrella a este proyecto. :star:

Pero, si quieres contribuir de forma más activa, puedes hacerlo de las siguientes maneras:

1. Asegúrese de entender como crear una extensión para Quarto [aquí](https://quarto.org/docs/extensions/formats.html).
1. Haga un fork del proyecto
2. Cree una rama con el nombre de la tesis que deseas agregar (`git checkout -b XXXX`)
3. Confirme sus cambios (`git commit -m 'tesis-XXXX agregada'`)
4. Suba sus cambios (`git push origin XXXX`)
5. Abra una solicitud de extracción (Pull Request)

> **Nota**: Si no está seguro de cómo hacerlo, puede abrir un problema (issue) [en el repositorio](https://github.com/adatar-do/tesis-rd/issues) y alguien lo hará por usted. ¡Esa es la magia de la comunidad de código abierto!


