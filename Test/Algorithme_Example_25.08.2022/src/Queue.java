public class Queue {

    private QueueItem head; // голова
    private QueueItem tail; // хвост

    public Queue() {

    }
    public int length = 0;
//    public length ++;

    public int size() {
        return length;
    }

    public void add(int item) { // метод добавления данных (элемента в очередь)
        QueueItem temp = new QueueItem();
        temp.value = item;
        if (isEmpty()) {
            // Очередь пуста, значит новый элемент будет и головой и хвостом
            head = temp;
        } else {
            // Очередь не пуста, поэтому новый элемент вставляется после tail
            tail.next = temp;
        }
        tail = temp;
    }

    public Queue(QueueItem head, QueueItem tail) {
        this.head = head;
        this.tail = tail;
    }

    // TODO Реализовать метод delete
    public int delete() { // извлечение
        int a = head.value;
        head = head.next;
        if (head == null) { // Не обязательная проверка
            tail = null;
        }
        return a;
    }

    public boolean isEmpty() { // пустая очередь
        return head == null;
    }

    private class QueueItem { // очередь (анг. элемент очереди)
        public int value;
        public QueueItem next;
    }
}
