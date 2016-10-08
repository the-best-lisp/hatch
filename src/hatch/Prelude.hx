package hatch;

class Prelude {

  public static var coreFunctions =
    [
     {name: 'list', form: '(-> (rest&) rest&)'},
     {name: 'id', form: '(-> (x) x)'},
     {name: 'not', form: '(-> (b) (if b #f #t))'},
     {name: 'foldl', form: '(-> (f acc l) (if (empty? l) acc (foldl f (f acc (head l)) (tail l))))'},
     {name: 'foldr', form: '(-> (f acc l) (if (empty? l) acc (foldr f (f (head l) acc) (tail l))))'},
     {name: 'reverse', form: '(foldr cons ())'},
     {name: 'map', form: '(-> (f l) (if (empty? l) () (cons (f (head l)) (map f (tail l)))))'},
     {name: '<>', form: '(-> (f g) (-> (x) (f (g x))))'},
     {name: '>>', form: '(-> (a rest&) (foldr (-> (f acc) (f acc)) a rest&))'},
     {name: 'filter', form: '(-> (p l) (reverse (foldr (-> (v acc) (if (p v) (cons v acc) acc)) () l)))'},
     {name: 'some?', form: '(-> (p l) (if (empty? l) #f (if (p (head l)) #t (some? p (tail l)))))'},
     {name: 'all?', form: '(-> (p l) (not (some? (<> not p) l)))'},
     {name: 'or', form: '(-> (rest&) (some? id rest&))'},
     {name: 'and', form: '(-> (rest&) (all? id rest&))'},
     {name: 'even?', form: '(<> (= 0) (% _ 2))'},
     {name: 'odd?', form: '(<> not even?)'},
     {name: 'zip', form: '(-> (rest&) (if (or (empty? rest&) (some? empty? rest&)) () 
                                          (cons (map head rest&) (apply zip (map tail rest&)))))'},
     {name: '++', form: '(-> (rest&) (foldl concat (head rest&) (tail rest&)))'}
       ];

}