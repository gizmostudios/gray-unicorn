from django.templatetags.static import static
from django.utils.html import format_html_join, escape

import wagtail.admin.rich_text.editors.draftail.features as draftail_features
from wagtail.admin.rich_text.converters.html_to_contentstate import (
    InlineStyleElementHandler,
)
from wagtail.core import hooks
from wagtail.core.rich_text import LinkHandler


# @hooks.register('insert_editor_js')
# def editor_js():
#     js_files = [
#         'js/footer_link.js',
#     ]
#     js_includes = format_html_join(
#         '\n', '<script src="{0}"></script>',
#         ((static(filename),) for filename in js_files)
#     )
#     return js_includes


@hooks.register('register_rich_text_features')
def register_superscript_feature(features):
    feature_name = 'superscript'
    type_ = 'SUPERSCRIPT'
    tag = 'sup'

    control = {
        'type': type_,
        'label': 'SUP',
        'description': 'Superscript',
    }

    features.register_editor_plugin(
        'draftail', feature_name, draftail_features.InlineStyleFeature(control)
    )

    db_conversion = {
        'from_database_format': {tag: InlineStyleElementHandler(type_)},
        'to_database_format': {'style_map': {type_: tag}},
    }

    features.default_features.append(feature_name)
    features.register_converter_rule(
        'contentstate', feature_name, db_conversion,
    )


@hooks.register('register_rich_text_features')
def register_subscript_feature(features):
    feature_name = 'subscript'
    type_ = 'SUBSCRIPT'
    tag = 'sub'

    control = {
        'type': type_,
        'label': 'SUB',
        'description': 'Subscript',
    }

    features.register_editor_plugin(
        'draftail', feature_name, draftail_features.InlineStyleFeature(control)
    )

    db_conversion = {
        'from_database_format': {tag: InlineStyleElementHandler(type_)},
        'to_database_format': {'style_map': {type_: tag}},
    }

    features.default_features.append(feature_name)
    features.register_converter_rule(
        'contentstate', feature_name, db_conversion,
    )


class NewWindowExternalLinkHandler(LinkHandler):
    # This specifies to do this override for external links only.
    # Other identifiers are available for other types of links.
    identifier = 'external'

    @classmethod
    def expand_db_attributes(cls, attrs):
        href = attrs["href"]
        # Let's add the target attr, and also rel="noopener" + noreferrer fallback.
        # See https://github.com/whatwg/html/issues/4078.
        return '<a href="%s" target="_blank" rel="noopener noreferrer">' % escape(href)


@hooks.register('register_rich_text_features')
def register_external_link(features):
    features.register_link_type(NewWindowExternalLinkHandler)
