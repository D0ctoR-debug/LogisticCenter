import com.finaproject.logistic.entity.BasketItem;
import com.finaproject.logistic.entity.Service;
import com.finaproject.logistic.entity.User;
import com.finaproject.logistic.repository.BasketItemDAO;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.EntityManager;

public class Main {

    @Autowired
    private BasketItemDAO basketItemDAO;

    @Autowired
    private EntityManager entityManager;

    public void method(){
        Service service = entityManager.find(Service.class,3);
        User user = entityManager.find(User.class,19);

        BasketItem basketItem = new BasketItem();
        basketItem.setService(service);
        basketItem.setUser(user);
        basketItem.setQuantity(1);

        basketItemDAO.save(basketItem);
    }
}
