import React from 'react'
import {
  CAvatar,
  CBadge,
  CButton,
  CDropdown,
  CDropdownHeader,
  CDropdownItem,
  CDropdownMenu,
  CDropdownToggle,
} from '@coreui/react-pro'
import CIcon from '@coreui/icons-react'
import { cilEnvelopeOpen } from '@coreui/icons'

import avatar1 from '@/public/images/avatars/1.jpg'
import avatar2 from '@/public/images/avatars/2.jpg'
import avatar3 from '@/public/images/avatars/3.jpg'
import avatar4 from '@/public/images/avatars/4.jpg'
import avatar5 from '@/public/images/avatars/5.jpg'

const AppHeaderDropdownMssg = () => {
  const itemsCount = 4
  return (
    <CDropdown variant="nav-item" alignment="end">
      <CDropdownToggle caret={false}>
        <span className="d-inline-block my-1 mx-2 position-relative">
          <CIcon icon={cilEnvelopeOpen} size="lg" />
          <CBadge color="danger" position="top-end" shape="rounded-circle" className="p-1">
            <span className="visually-hidden">{itemsCount} new alerts</span>
          </CBadge>
        </span>
      </CDropdownToggle>
      <CDropdownMenu className="py-0" style={{ minWidth: '24rem' }}>
        <CDropdownHeader className="bg-body-secondary text-body-secondary fw-semibold rounded-top mb-2">
          Você tem {itemsCount} mensagens
        </CDropdownHeader>
        <CDropdownItem href="#">
          <div className="d-flex">
            <CAvatar className="flex-shrink-0 my-3 me-3" src={avatar1.src} status="success" />
            <div className="message text-wrap">
              <div className="d-flex justify-content-between text-body-secondary small mt-1">
                <div>Jessica Williams</div>
                <div>Agora</div>
              </div>
              <div className="fw-semibold">
                <span className="text-danger">!</span> Urgente: Manutenção do Sistema Hoje à Noite
              </div>
              <div className="small text-body-secondary">
              Atenção equipe, será realizada uma manutenção crítica do sistema hoje à noite, das 22h às 2h. Planejem-se adequadamente...
              </div>
            </div>
          </div>
        </CDropdownItem>
        <CDropdownItem href="#">
          <div className="d-flex">
            <CAvatar className="flex-shrink-0 my-3 me-3" src={avatar2.src} status="warning" />
            <div className="message text-wrap">
              <div className="d-flex justify-content-between small text-body-secondary mt-1">
                <div>Richard Johnson</div>
                <div>5 minutos atrás</div>
              </div>
              <div className="fw-semibold">
                <span className="text-danger">!</span> Atualização: Meta Atingida
              </div>
              <div className="small text-body-secondary">
              parabéns por atingir as metas de vendas no último trimestre! Vamos manter o ritmo. Novos objetivos,
              novas vitórias pela frente..
              </div>
            </div>
          </div>
        </CDropdownItem>
        <CDropdownItem href="#">
          <div className="d-flex">
            <CAvatar className="flex-shrink-0 my-3 me-3" src={avatar4.src} status="secondary" />
            <div className="message text-wrap">
              <div className="d-flex justify-content-between small text-body-secondary mt-1">
                <div>Angela Rodriguez</div>
                <div>13:52</div>
              </div>
              <div className="fw-semibold">Lançamento de Campanha</div>
              <div className="small text-body-secondary">
              Notícias emocionantes! Nossa nova campanha nas redes sociais vai ao ar amanhã.
              </div>
            </div>
          </div>
        </CDropdownItem>
        <CDropdownItem href="#">
          <div className="d-flex">
            <CAvatar className="flex-shrink-0 my-3 me-3" src={avatar5.src} status="success" />
            <div className="message text-wrap">
              <div className="d-flex justify-content-between small text-body-secondary mt-1">
                <div>Jane Lewis</div>
                <div>16:03</div>
              </div>
              <div className="fw-semibold">Checagem de Inventario</div>
              <div className="small text-body-secondary">
              Equipe, é hora de nossa verificação mensal de inventário. Contagens precisas garantem suavidade
              operações. Vamos acertar...
              </div>
            </div>
          </div>
        </CDropdownItem>
        <CDropdownItem href="#">
          <div className="d-flex">
            <CAvatar className="flex-shrink-0 my-3 me-3" src={avatar3.src} status="secondary" />
            <div className="message text-wrap">
              <div className="d-flex justify-content-between small text-body-secondary mt-1">
                <div>Ryan Miller</div>
                <div>3 dias atrás</div>
              </div>
              <div className="fw-semibold">Feedback de Clientes</div>
              <div className="small text-body-secondary">
              Nosso feedback mais recente dos clientes chegou. Vamos analisar e discutir melhorias para
              um serviço ainda melhor...
              </div>
            </div>
          </div>
        </CDropdownItem>
        <div className="p-2">
          <CButton color="primary" variant="outline" className="w-100">
            Ver todas as Mensagens
          </CButton>
        </div>
      </CDropdownMenu>
    </CDropdown>
  )
}

export default AppHeaderDropdownMssg
