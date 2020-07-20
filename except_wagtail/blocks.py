from wagtail.images.blocks import ImageChooserBlock
from wagtail.embeds.blocks import EmbedBlock
from wagtail.core.blocks import (
    CharBlock, ChoiceBlock, RichTextBlock, StreamBlock, StructBlock, TextBlock,
    RawHTMLBlock, ListBlock
)


class ImageBlock(StructBlock):
    """
    Custom `StructBlock` for utilizing images with associated caption and
    attribution data
    """
    image = ImageChooserBlock(required=True)
    caption = CharBlock(required=False)
    attribution = CharBlock(required=False)

    class Meta:
        icon = 'image'
        template = '_blocks/image_block.html'


class HeadingBlock(StructBlock):
    """
    Custom `StructBlock` that allows the user to select h2 - h4 sizes for
    headers
    """
    heading_text = CharBlock(classname='title', required=True)
    size = ChoiceBlock(choices=[
        ('', 'Select a header size'),
        ('h2', 'H2'),
        ('h2nb', 'H2 - no border on top'),
        ('h3', 'H3'),
        ('h3nb', 'H3 - no border on top'),
        ('h4', 'H4'),
        ('h4nb', 'H4 - no border on top'),
    ], required=True)

    class Meta:
        icon = 'title'
        template = '_blocks/heading_block.html'


class BlockQuote(StructBlock):
    """
    Custom `StructBlock` that allows the user to attribute a quote to the
    author
    """
    text = TextBlock()
    attribute_name = CharBlock(
        blank=True, required=False, label='e.g. Mary Berry'
    )

    class Meta:
        icon = 'fa-quote-left'
        template = '_blocks/blockquote.html'


class ParagraphBlock(StructBlock):
    text = RichTextBlock()

    class Meta:
        con = 'fa-paragraph'
        template = '_blocks/paragraph_block.html'


class CarouselBlock(StructBlock):
    """
    Custom `StructBlock` for utilizing images with associated caption and
    attribution data within a carousel
    """

    image_list = ListBlock(ImageBlock)

    class Meta:
        con = 'fa-paragraph'
        template = '_blocks/carousel_block.html'


class LightboxBlock(StructBlock):
    """
    Custom `StructBlock` for utilizing images with associated caption and
    attribution data within a lightbox
    """

    image_list = ListBlock(ImageBlock)

    class Meta:
        con = 'fa-paragraph'
        template = '_blocks/lightbox_block.html'


# StreamBlocks
class BaseStreamBlock(StreamBlock):
    """
    Define the custom blocks that `StreamField` will utilize
    """
    carousel_block = CarouselBlock()
    lightbox_block = LightboxBlock()
    heading_block = HeadingBlock()
    paragraph_block = ParagraphBlock()
    image_block = ImageBlock()
    block_quote = BlockQuote()
    embed_block = EmbedBlock(
        help_text='Insert an embed URL e.g https://www.youtube.com/embed/<id>',
        icon='fa-s15',
        template='_blocks/embed_block.html',
    )
    html_block = RawHTMLBlock(
        icon='fa-paragraph',
        template='_blocks/html_block.html',
        required=False,
    )


# StreamBlocks
class FooterStreamBlock(StreamBlock):
    """
    Define the custom blocks that `StreamField` will utilize
    """
    html_block = RawHTMLBlock(
        icon='fa-paragraph',
        template='_blocks/html_block.html',
        required=False
    )
