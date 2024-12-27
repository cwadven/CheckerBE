from django.db import models
from map.models import (
    Arrow,
    Map,
)
from member.models import Member


class ArrowProgress(models.Model):
    map = models.ForeignKey(
        Map,
        on_delete=models.DO_NOTHING,
        related_name='arrow_progresses',
    )
    arrow = models.ForeignKey(
        Arrow,
        on_delete=models.DO_NOTHING,
        related_name='progresses',
        help_text='진행 중인 Arrow',
    )
    member = models.ForeignKey(
        Member,
        on_delete=models.DO_NOTHING,
        related_name='arrow_progresses',
        help_text='진행 중인 사용자',
    )
    is_resolved = models.BooleanField(default=False, help_text='해결 여부')
    resolved_at = models.DateTimeField(null=True, blank=True, help_text='해결된 시각')
    created_at = models.DateTimeField(auto_now_add=True, db_index=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Arrow 진행상태'
        verbose_name_plural = 'Arrow 진행상태'

    def __str__(self):
        return f'{self.member.nickname}의 {self.arrow} 진행상태'