from common.common_criteria.cursor_criteria import CursorCriteria


class MapListCursorCriteria(CursorCriteria):
    cursor_keys = [
        'id__lt',
        'created_at__lte',
    ]


class MapSubscriptionListCursorCriteria(CursorCriteria):
    cursor_keys = [
        'id__lt',
        'updated_at__lte',
    ]
